import '../../model/best_seller_products.dart';

abstract interface class BestSellerRemoteDataSource {
  Future<BestSellerProducts> getBestSellers();
}
