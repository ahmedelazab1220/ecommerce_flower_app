import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/product_entity.dart';
import '../../domain/entity/occasion_entity.dart';
import '../../domain/entity/occasions_response_entity.dart';
import '../../domain/usecase/get_all_occasions_usecase.dart';
import '../../domain/usecase/get_products_by_id_usecase.dart';

part 'occasion_state.dart';

@injectable
class OccasionCubit extends Cubit<OccasionState> {
  final GetAllOccasionsUsecase _getAllOccasionsUsecase;
  final GetProductsByIdUsecase _getProductsByIdUsecase;
  List<OccasionEntity>? occasions;
  List<ProductEntity>? products = [];

  OccasionCubit(this._getAllOccasionsUsecase, this._getProductsByIdUsecase)
    : super(OccasionState(occasionState: BaseInitialState()));

  Future<void> _getAllOccasions([int? index]) async {
    emit(state.copyWith(occasionState: BaseLoadingState()));
    final result = await _getAllOccasionsUsecase.call();
    switch (result) {
      case SuccessResult<OccasionResponseEntity>():
        {
          occasions = result.data.occasions;
          final myTabs = occasions?.map((e) => Tab(text: e.name)).toList();
          emit(
            state.copyWith(
              occasionState: BaseSuccessState<List<Tab>>(data: myTabs),
            ),
          );
          _changeOccasionTab((index ?? 1) - 1);
        }
      case FailureResult<OccasionResponseEntity>():
        {
          emit(
            state.copyWith(
              occasionState: BaseErrorState(
                errorMessage: result.exception.toString(),
              ),
            ),
          );
        }
    }
  }

  Future<void> _getProductsById(String occasionId) async {
    emit(state.copyWith(productsState: BaseLoadingState()));
    final result = await _getProductsByIdUsecase.call(occasionId);
    switch (result) {
      case SuccessResult<List<ProductEntity>>():
        {
          emit(
            state.copyWith(
              productsState: BaseSuccessState<List<ProductEntity>>(
                data: result.data,
              ),
            ),
          );
        }
      case FailureResult<List<ProductEntity>>():
        {
          emit(
            state.copyWith(
              productsState: BaseErrorState(
                errorMessage: result.exception.toString(),
              ),
            ),
          );
        }
    }
  }

  Future<void> _changeOccasionTab(int tabIndex) async {
    if (tabIndex < 0 || tabIndex >= occasions!.length) tabIndex = 0;
    emit(state.copyWith(selectedTabIndex: tabIndex));
    final occasionId = occasions?[tabIndex].id;
    if (occasionId != null) {
      await _getProductsById(occasionId);
    }
  }

  void doIntent(OccasionAction action) async {
    switch (action) {
      case OccasionRequestAction():
        {
          _getAllOccasions(action.index);
        }
      case ChangeOccasionTabAction():
        {
          _changeOccasionTab(action.tabIndex);
        }
    }
  }
}
