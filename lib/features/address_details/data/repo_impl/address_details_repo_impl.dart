import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/address_details_request_entity.dart';
import '../../domain/repo/address_details_repo.dart';
import '../data_sources/contract/address_details_data_source.dart';
import '../models/request/address_details_request_dto.dart';

@LazySingleton(as: AddressDetailsRepo)
class AddressDetailsRepoImpl implements AddressDetailsRepo {
  final AddressDetailsDataSource _dataSource;
  final ApiManager _apiManager;

  AddressDetailsRepoImpl(this._dataSource, this._apiManager);
  @override
  Future<Result<void>> addAddressDetails(
    AddressDetailsRequestEntity request,
  ) async {
    final response = await _apiManager.execute<void>(() async {
      await _dataSource.addAddressDetails(
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
      await _dataSource.updateAddressDetails(
        id,
        AddressDetailsRequestDto.fromDomain(request),
      );
    });
    return response;
  }
}
