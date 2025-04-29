import 'dart:convert';

import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:ecommerce_flower_app/features/address_details/data/models/response/city_dto.dart';
import 'package:ecommerce_flower_app/features/address_details/data/models/response/state_dto.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../contract/address_details_local_data_source.dart';

@LazySingleton(as: AddressDetailsLocalDataSource)
class AddressDetailsLocalDataSourceImpl
    implements AddressDetailsLocalDataSource {
  @override
  Future<List<CityDto>> getCities() async {
    final response = await rootBundle.loadString(Constants.citiesRoute);
    final data = json.decode(response);
    final cities = data[2]['data'] as List<dynamic>;
    return cities.map((e) => CityDto.fromJson(e)).toList();
  }

  @override
  Future<List<StateDto>> getStates() async {
    final response = await rootBundle.loadString(Constants.statesRoute);
    final data = json.decode(response);
    final state = data[2]['data'] as List<dynamic>;
    return state.map((e) => StateDto.fromJson(e)).toList();
  }
}
