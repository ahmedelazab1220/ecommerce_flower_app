import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/data/model/best_seller_products.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';

part 'best_seller_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BestSellerRetrofitClient {
  @factoryMethod
  factory BestSellerRetrofitClient(Dio dio) = _BestSellerRetrofitClient;

  @GET(ApiConstants.bestSellerRoute)
  Future<BestSellerProducts> getBestSellers();
}
