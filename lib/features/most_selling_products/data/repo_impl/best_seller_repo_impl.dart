import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/domain/repo/best_seller_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../data_source/contract/best_seller_remote_data_source.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImpl implements BestSellerRepo {
  final ApiManager _apiManager;
  final BestSellerRemoteDataSource _bestSellerRemoteDataSource;

  BestSellerRepoImpl(this._bestSellerRemoteDataSource, this._apiManager);

  @override
  Future<Result<List<ProductEntity>>> getBestSellers() async {
    return await _apiManager.execute(() async {
      final response = await _bestSellerRemoteDataSource.getBestSellers();
      return response.bestSeller!.map((e) => e.toEntity()).toList();
    });
  }
}
