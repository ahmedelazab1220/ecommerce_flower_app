import 'package:bloc/bloc.dart';
import 'package:ecommerce_flower_app/features/occasions/domain/entity/products_entity.dart';
import 'package:ecommerce_flower_app/features/occasions/domain/usecase/get_products_by_id_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../domain/entity/occasions_entity.dart';
import '../../domain/usecase/get_all_occasions_usecase.dart';

part 'occasion_state.dart';

@injectable
class OccasionCubit extends Cubit<OccasionState> {
  final GetAllOccasionsUsecase _getAllOccasionsUsecase;
  final GetProductsByIdUsecase _getProductsByIdUsecase;

  List<OccasionEntity>? occasions;
  List<ProductEntity>? products;

  OccasionCubit(this._getAllOccasionsUsecase, this._getProductsByIdUsecase)
    : super(OccasionState(baseState: BaseInitialState()));

  Future<void> getAllOccasions() async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _getAllOccasionsUsecase.call();
    switch (result) {
      case SuccessResult<OccasionsEntity>():
        emit(state.copyWith(baseState: BaseSuccessState()));
        occasions = result.data.occasions;
        Logger().f("Occasions: $occasions");
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

  Future<void> getProductsById(String occasionId) async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _getProductsByIdUsecase.call(occasionId);
    switch (result) {
      case SuccessResult<ProductsEntity>():
        emit(state.copyWith(baseState: BaseSuccessState()));
        products = result.data.products;
        Logger().f("Products: $products");
      case FailureResult<ProductsEntity>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  void doIntent(OccasionAction action) async {
    switch (action) {
      case OccasionRequestAction():
        getAllOccasions();
    }
  }
}
