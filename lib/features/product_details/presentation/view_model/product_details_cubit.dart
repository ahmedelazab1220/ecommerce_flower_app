import 'package:bloc/bloc.dart';
import 'package:ecommerce_flower_app/features/product_details/presentation/view_model/product_details_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_features/add_to_cart/data/model/request/add_to_cart_request_dto.dart';
import '../../../../core/utils/shared_features/add_to_cart/data/model/response/add_to_cart_response_dto.dart';
import '../../../../core/utils/shared_features/add_to_cart/domain/usecase/add_to_cart_use_case.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final AddToCartUseCase _addToCartUseCase;
  ProductDetailsCubit(this._addToCartUseCase)
    : super(ProductDetailsState(baseState: BaseInitialState()));

  Future<void> _addProductToCart(String productId) async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _addToCartUseCase(
      AddToCartRequestDto(product: productId, quantity: 1),
    );
    switch (result) {
      case SuccessResult<AddToCartResponseDto>():
        emit(state.copyWith(baseState: BaseSuccessState(data: result.data)));
      case FailureResult<AddToCartResponseDto>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  void doIntent(ProductDetailsAction action) {
    switch (action) {
      case AddProductToCartAction():
        _addProductToCart(action.productId);
    }
  }
}
