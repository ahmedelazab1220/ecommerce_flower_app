import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_constants.dart';
import 'package:ecommerce_flower_app/features/categories/data/models/categories_response/categories_response.dart';
import 'package:ecommerce_flower_app/features/categories/data/models/products_response/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CategoriesRetrofitClient {
  @factoryMethod
  factory CategoriesRetrofitClient(Dio dio) = _CategoriesRetrofitClient;

  @GET(ApiConstants.categoriesRoute)
  Future<CategoriesResponse> getCategories();

  @GET(ApiConstants.allProductsRoute)
  Future<ProductsResponse> getProductsByCategory({
    @Query('category') String? categoryId,
  });
}
