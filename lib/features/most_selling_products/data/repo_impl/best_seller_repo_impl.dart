import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/domain/entity/best_seller_product_entity.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/domain/repo/best_seller_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../data_source/contract/best_seller_remote_data_source.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImpl implements BestSellerRepo {
  final ApiManager _apiManager = ApiManager();
  final BestSellerRemoteDataSource bestSellerRemoteDataSource;

  BestSellerRepoImpl({required this.bestSellerRemoteDataSource});

  @override
  Future<Result<List<BestSellerProductEntity>>> getBestSellers() async {
    return await _apiManager.execute(() async {
      final response = await bestSellerRemoteDataSource.getBestSellers();
      return response.bestSeller!.map((e) => e.toEntity()).toList();
    });
  }
}
