import '../../model/best_seller_products.dart';

abstract class BestSellerRemoteDataSource {
  Future<BestSellerProducts> getBestSellers();
}
