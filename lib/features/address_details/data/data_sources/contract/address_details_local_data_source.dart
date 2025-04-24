import '../../models/response/city_dto.dart';
import '../../models/response/state_dto.dart';

abstract class AddressDetailsLocalDataSource {
  Future<List<CityDto>> getCities();
  Future<List<StateDto>> getStates();
}
