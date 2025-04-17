import '../../../../core/utils/shared_models/product_entity.dart';

class CartEntity {
  final int numOfCartItems;
  final List<ProductEntity> cartList;
  final int totalPrice;
  final int discount;
  final int totalPriceAfterDiscount;

  const CartEntity({
    required this.numOfCartItems,
    required this.cartList,
    required this.totalPrice,
    required this.discount,
    required this.totalPriceAfterDiscount,
  });
}
