import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/entities/city_entity.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/entities/state_entity.dart';
import 'package:ecommerce_flower_app/features/saved_addresses/domain/entity/address_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class AddressDetailsState extends Equatable {
  final BaseState? addressDetailsState;
  final LatLng? selectedLocation;
  final List<CityEntity> cities;
  final List<StateEntity> areas;
  final String? selectedAreaId;
  final String? selectedCityId;
  final String? selectedCityName;
  final List<CityEntity> filteredCities;
  final bool isFormValid;
  final bool hasChanged;

  const AddressDetailsState({
    this.addressDetailsState,
    this.selectedLocation = const LatLng(30.0444, 31.2357),
    this.cities = const [],
    this.areas = const [],
    this.selectedAreaId,
    this.selectedCityId,
    this.selectedCityName,
    this.filteredCities = const [],
    this.isFormValid = false,
    this.hasChanged = true,
  });

  AddressDetailsState copyWith({
    BaseState? addressDetailsState,
    LatLng? selectedLocation,
    List<CityEntity>? cities,
    List<StateEntity>? areas,
    String? selectedAreaId,
    String? selectedCityId,
    String? selectedCityName,
    List<CityEntity>? filteredCities,
    bool? isFormValid,
    bool? hasChanged,
  }) {
    return AddressDetailsState(
      addressDetailsState: addressDetailsState ?? this.addressDetailsState,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      cities: cities ?? this.cities,
      areas: areas ?? this.areas,
      selectedAreaId: selectedAreaId ?? this.selectedAreaId,
      selectedCityId: selectedCityId ?? this.selectedCityId,
      selectedCityName: selectedCityName ?? this.selectedCityName,
      filteredCities: filteredCities ?? this.filteredCities,
      isFormValid: isFormValid ?? this.isFormValid,
      hasChanged: hasChanged ?? this.hasChanged,
    );
  }

  @override
  List<Object?> get props => [
    addressDetailsState,
    selectedLocation,
    cities,
    areas,
    selectedAreaId,
    selectedCityId,
    selectedCityName,
    filteredCities,
    isFormValid,
    hasChanged,
  ];
}

sealed class AddressDetailsAction {}

final class LoadCitiesAndAreasAction extends AddressDetailsAction {}

final class SetInitialAddressAction extends AddressDetailsAction {
  final AddressEntity address;
  SetInitialAddressAction(this.address);
}

final class SelectAreaAction extends AddressDetailsAction {
  final String areaId;
  SelectAreaAction(this.areaId);
}

final class SelectCityAction extends AddressDetailsAction {
  final String cityId;
  SelectCityAction(this.cityId);
}

final class FormChangedAction extends AddressDetailsAction {}

final class ButtonPressedAction extends AddressDetailsAction {}

final class CameraMovedAction extends AddressDetailsAction {
  final LatLng position;
  final bool hasGesture;
  CameraMovedAction(this.position, this.hasGesture);
}
