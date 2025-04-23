import 'dart:convert';

import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:ecommerce_flower_app/features/address_details/data/models/response/city.dart';
import 'package:ecommerce_flower_app/features/address_details/data/models/response/state.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../contract/address_details_local_data_source.dart';

@LazySingleton(as: AddressDetailsLocalDataSource)
class AddressDetailsLocalDataSourceImpl
    implements AddressDetailsLocalDataSource {
  @override
  Future<List<City>> getCities() async {
    final response = await rootBundle.loadString(Constants.citiesRoute);
    final data = json.decode(response);
    final cities = data[2]['data'] as List<dynamic>;
    return cities.map((e) => City.fromJson(e)).toList();
  }

  @override
  Future<List<State>> getStates() async {
    final response = await rootBundle.loadString(Constants.statesRoute);
    final data = json.decode(response);
    final state = data[2]['data'] as List<dynamic>;
    return state.map((e) => State.fromJson(e)).toList();
  }
}
