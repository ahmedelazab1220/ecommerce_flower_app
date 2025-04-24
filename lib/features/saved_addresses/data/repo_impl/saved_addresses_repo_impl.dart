import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/saved_addresses/domain/entity/address_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../../domain/repo/saved_addresses_repo.dart';
import '../data_source/contract/saved_addresses_remote_data_source.dart';

@Injectable(as: SavedAddressesRepo)
class SavedAddressesRepoImpl implements SavedAddressesRepo {
  final SavedAddressesRemoteDataSource _savedAddressesRemoteDataSource;
  final ApiManager _apiManager;

  SavedAddressesRepoImpl(
    this._savedAddressesRemoteDataSource,
    this._apiManager,
  );

  @override
  Future<Result<List<AddressEntity>?>> getUserSavedAddresses() {
    var response = _apiManager.execute<List<AddressEntity>?>(() async {
      var response =
          await _savedAddressesRemoteDataSource.getUserSavedAddresses();
      return response.addresses?.map((e) => e.toEntity()).toList();
    });
    return response;
  }

  @override
  Future<Result<List<AddressEntity>?>> deleteAddress({
    required String addressId,
  }) {
    var response = _apiManager.execute<List<AddressEntity>?>(() async {
      var response = await _savedAddressesRemoteDataSource.deleteAddress(
        addressId,
      );
      return response.addresses?.map((e) => e.toEntity()).toList();
    });
    return response;
  }
}
