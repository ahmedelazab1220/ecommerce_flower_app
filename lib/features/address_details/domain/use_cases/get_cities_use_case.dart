import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entities/city_entity.dart';
import '../repo/address_details_repo.dart';

@lazySingleton
class GetCitiesUseCase {
  final AddressDetailsRepo _repo;
  GetCitiesUseCase(this._repo);
  Future<Result<List<CityEntity>>> call() async {
    return await _repo.getCities();
  }
}
