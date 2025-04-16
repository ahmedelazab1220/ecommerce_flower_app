import 'best_seller_entity.dart';
import 'category_entity.dart';
import 'occasion_entity.dart';
import 'product_entity.dart';

class HomeResponseEntity {
  final String? message;
  final List<ProductEntity>? products;
  final List<CategoryEntity>? categories;
  final List<BestSellerEntity>? bestSeller;
  final List<OccasionEntity>? occasions;

  HomeResponseEntity({
    this.message,
    this.products,
    this.categories,
    this.bestSeller,
    this.occasions,
  });
}
