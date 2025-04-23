class CartEntity {
  final int? discount;
  final int? totalPrice;
  final int? totalPriceAfterDiscount;

  CartEntity({
    required this.discount,
    required this.totalPrice,
    required this.totalPriceAfterDiscount,
  });
}
