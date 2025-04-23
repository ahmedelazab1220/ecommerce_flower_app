import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/address_details_request_entity.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/entities/state_entity.dart';
import '../../domain/repo/address_details_repo.dart';
import '../data_sources/contract/address_details_local_data_source.dart';
import '../data_sources/contract/address_details_remote_data_source.dart';
import '../models/request/address_details_request_dto.dart';

@LazySingleton(as: AddressDetailsRepo)
class AddressDetailsRepoImpl implements AddressDetailsRepo {
  final AddressDetailsRemoteDataSource _remoteDataSource;
  final AddressDetailsLocalDataSource _localDataSource;
  final ApiManager _apiManager;

  AddressDetailsRepoImpl(
    this._remoteDataSource,
    this._apiManager,
    this._localDataSource,
  );
  @override
  Future<Result<void>> addAddressDetails(
    AddressDetailsRequestEntity request,
  ) async {
    final response = await _apiManager.execute<void>(() async {
      await _remoteDataSource.addAddressDetails(
        AddressDetailsRequestDto.fromDomain(request),
      );
    });
    return response;
  }

  @override
  Future<Result<void>> updateAddressDetails(
    String id,
    AddressDetailsRequestEntity request,
  ) async {
    final response = await _apiManager.execute<void>(() async {
      await _remoteDataSource.updateAddressDetails(
        id,
        AddressDetailsRequestDto.fromDomain(request),
      );
    });
    return response;
  }

  @override
  Future<Result<List<CityEntity>>> getCities() async {
    final response = await _apiManager.execute<List<CityEntity>>(() async {
      final result = await _localDataSource.getCities();
      return result.map((e) => e.toEntity()).toList();
    });
    return response;
  }

  @override
  Future<Result<List<StateEntity>>> getState() async {
    final response = await _apiManager.execute<List<StateEntity>>(() async {
      final result = await _localDataSource.getStates();
      return result.map((e) => e.toEntity()).toList();
    });
    return response;
  }
}
