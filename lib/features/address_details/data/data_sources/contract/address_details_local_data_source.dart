import '../../models/response/city.dart';
import '../../models/response/state.dart';

abstract class AddressDetailsLocalDataSource {
  Future<List<City>> getCities();
  Future<List<State>> getStates();
}
