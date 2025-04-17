import 'package:bloc/bloc.dart';
import 'package:ecommerce_flower_app/features/occasions/domain/usecase/get_products_by_id_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/product_entity.dart';
import '../../domain/entity/occasions_entity.dart';
import '../../domain/usecase/get_all_occasions_usecase.dart';

part 'occasion_state.dart';

@injectable
class OccasionCubit extends Cubit<OccasionState> {
  final GetAllOccasionsUsecase _getAllOccasionsUsecase;
  final GetProductsByIdUsecase _getProductsByIdUsecase;

  List<OccasionEntity>? occasions;
  List<ProductEntity>? products = [];

  List<Tab>? myTabs = [];

  OccasionCubit(this._getAllOccasionsUsecase, this._getProductsByIdUsecase)
    : super(OccasionState(baseState: BaseInitialState()));

  Future<void> _getAllOccasions([int? index]) async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _getAllOccasionsUsecase.call();
    switch (result) {
      case SuccessResult<OccasionsEntity>():
        occasions = result.data.occasions;
        myTabs = occasions?.map((e) => Tab(text: e.name)).toList();
        emit(state.copyWith(baseState: BaseSuccessState()));
        _changeOccasionTab((index ?? 1) - 1);
        break;
      case FailureResult<OccasionsEntity>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _getProductsById(String occasionId) async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _getProductsByIdUsecase.call(occasionId);
    switch (result) {
      case SuccessResult<List<ProductEntity>>():
        emit(state.copyWith(baseState: BaseSuccessState()));
        products = result.data;
        Logger().f("Products: $products");
      case FailureResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _changeOccasionTab(int tabIndex) async {
    emit(state.copyWith(selectedTabIndex: tabIndex));
    final occasionId = occasions?[tabIndex].id;
    if (occasionId != null) {
      await _getProductsById(occasionId);
    }
  }

  void doIntent(OccasionAction action) async {
    switch (action) {
      case OccasionRequestAction():
        _getAllOccasions(action.index);
      case ProductsRequestAction():
        _getProductsById(action.occasionId);
      case ChangeOccasionTabAction():
        _changeOccasionTab(action.tabIndex);
    }
  }
}
