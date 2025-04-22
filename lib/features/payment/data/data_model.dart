class Payment {
  final String method;
  final double subTotal;
  final double deliveryFee;
  final bool isGift;
  final String? giftName;
  final String? giftPhone;

  Payment({
    String? method,
    double? subTotal,
    double? deliveryFee,
    this.isGift = false,
    this.giftName,
    this.giftPhone,
  }) : method = method ?? "cash",
       subTotal = subTotal ?? 0.0,
       deliveryFee = deliveryFee ?? 0.0;

  double get total => subTotal + deliveryFee;
}
