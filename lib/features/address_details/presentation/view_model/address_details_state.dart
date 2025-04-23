import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/entities/city_entity.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/entities/state_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/entities/address_details_request_entity.dart';

class AddressDetailsState extends Equatable {
  final BaseState? addAddressState;
  final BaseState? updateAddressState;
  final LatLng? selectedLocation;
  final List<CityEntity> cities;
  final List<StateEntity> areas;
  final String? selectedGovernorateId;
  final String? selectedCityId;
  final List<CityEntity> filteredCities;

  const AddressDetailsState({
    this.addAddressState,
    this.updateAddressState,
    this.selectedLocation = const LatLng(30.0444, 31.2357),
    this.cities = const [],
    this.areas = const [],
    this.selectedGovernorateId,
    this.selectedCityId,
    this.filteredCities = const [],
  });

  AddressDetailsState copyWith({
    BaseState? addAddressState,
    BaseState? updateAddressState,
    LatLng? selectedLocation,
    List<CityEntity>? cities,
    List<StateEntity>? areas,
    String? selectedGovernorateId,
    String? selectedCityId,
    List<CityEntity>? filteredCities,
  }) {
    return AddressDetailsState(
      addAddressState: addAddressState ?? this.addAddressState,
      updateAddressState: updateAddressState ?? this.updateAddressState,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      cities: cities ?? this.cities,
      areas: areas ?? this.areas,
      selectedGovernorateId:
          selectedGovernorateId ?? this.selectedGovernorateId,
      selectedCityId: selectedCityId ?? this.selectedCityId,
      filteredCities: filteredCities ?? this.filteredCities,
    );
  }

  @override
  List<Object?> get props => [
    addAddressState,
    updateAddressState,
    selectedLocation,
    cities,
    areas,
    selectedGovernorateId,
    selectedCityId,
    filteredCities,
  ];
}

sealed class AddressDetailsAction {}

final class AddAddressAction extends AddressDetailsAction {
  final AddressDetailsRequestEntity request;

  AddAddressAction(this.request);
}

final class UpdateAddressAction extends AddressDetailsAction {
  final AddressDetailsRequestEntity request;
  final String addressId;

  UpdateAddressAction(this.request, this.addressId);
}

final class UpdateSelectedLocationAction extends AddressDetailsAction {
  final LatLng selectedLocation;

  UpdateSelectedLocationAction(this.selectedLocation);
}

final class LoadCitiesAndAreasAction extends AddressDetailsAction {}

final class UpdateGovernorateIdAction extends AddressDetailsAction {
  final String governorateId;
  UpdateGovernorateIdAction(this.governorateId);
}

final class UpdateCityIdAction extends AddressDetailsAction {
  final String cityId;
  UpdateCityIdAction(this.cityId);
}
