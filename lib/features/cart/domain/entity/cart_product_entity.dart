class CartProductEntity {
  final String id;
  final String title;
  final String description;
  final String imgCover;
  final int price;
  final int quantity;

  CartProductEntity({
    required this.id,
    required this.title,
    required this.imgCover,
    required this.price,
    required this.quantity,
    required this.description,
  });

  factory CartProductEntity.fake() {
    return CartProductEntity(
      id: '',
      title: '',
      description: '',
      imgCover: '',
      price: 0,
      quantity: 1,
    );
  }
}
