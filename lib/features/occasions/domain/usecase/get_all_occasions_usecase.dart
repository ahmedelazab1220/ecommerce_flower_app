import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/occasions/domain/entity/occasions_entity.dart';
import 'package:ecommerce_flower_app/features/occasions/domain/repo/occasion_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllOccasionsUsecase {
  final OccasionRepo _occasionRepo;
  GetAllOccasionsUsecase(this._occasionRepo);

  Future<Result<OccasionsEntity>> call() async {
    return await _occasionRepo.getAllOccasions();
  }
}
