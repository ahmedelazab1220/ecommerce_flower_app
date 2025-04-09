import 'package:ecommerce_flower_app/features/most_selling_products/data/data_source/contract/best_seller_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../api/best_seller_retrofit_client.dart';
import '../../model/best_seller_products.dart';

@Injectable(as: BestSellerRemoteDataSource)
class BestSellerRemoteDataSourceImpl implements BestSellerRemoteDataSource {
  final BestSellerRetrofitClient _bestSellerRetrofitClient;

  BestSellerRemoteDataSourceImpl(this._bestSellerRetrofitClient);

  @override
  Future<BestSellerProducts> getBestSellers() async {
    return await _bestSellerRetrofitClient.getBestSellers();
  }
}
