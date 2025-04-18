class ProductEntity {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final num? price;
  final num? priceAfterDiscount;
  final num? quantity;
  final String? category;
  final String? occasion;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;
  final num? discount;
  final num? sold;
  final num? rateAvg;
  final num? rateCount;
  final String? productId;

  ProductEntity({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
    this.productId,
  });

  factory ProductEntity.fake() {
    return ProductEntity(
      id: '',
      title: '',
      slug: '',
      description: '',
      imgCover: '',
      images: [],
      price: 0,
      priceAfterDiscount: 0,
      quantity: 0,
      category: '',
      occasion: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      v: 0,
      discount: 0,
      sold: 0,
      rateAvg: 0,
      rateCount: 0,
      productId: '',
    );
  }
}
