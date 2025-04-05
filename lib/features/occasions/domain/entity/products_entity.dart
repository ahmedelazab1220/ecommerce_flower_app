class ProductsEntity {
  String? message;
  List<ProductEntity>? products;

  ProductsEntity({this.message, this.products});
}

class ProductEntity {
  String? title;
  String? description;
  String? imgCover;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  int? discount;
  int? sold;
  double? rateAvg;
  int? rateCount;

  ProductEntity({
    this.title,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
  });
}
