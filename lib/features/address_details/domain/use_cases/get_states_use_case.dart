import 'package:ecommerce_flower_app/features/address_details/domain/entities/state_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../repo/address_details_repo.dart';

@lazySingleton
class GetStatesUseCase {
  final AddressDetailsRepo _repo;
  GetStatesUseCase(this._repo);

  Future<Result<List<StateEntity>>> call() async {
    return await _repo.getState();
  }
}
