import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/domain/usecase/get_best_sellers_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'best_seller_state.dart';

@injectable
class BestSellerCubit extends Cubit<BestSellerState> {
  final GetBestSellersUsecase _getBestSellersUsecase;

  BestSellerCubit(this._getBestSellersUsecase)
    : super(BestSellerState(baseState: BaseInitialState()));

  void doIntent(BestSellerAction action) {
    switch (action) {
      case BestSellerRequestAction():
        _getBestSellers();
    }
  }

  Future<void> _getBestSellers() async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _getBestSellersUsecase();
    switch (result) {
      case SuccessResult<List<ProductEntity>>():
        emit(state.copyWith(baseState: BaseSuccessState(data: result.data)));
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
}
