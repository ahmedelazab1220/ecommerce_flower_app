import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/use_cases/get_cities_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import '../../data/models/response/address.dart';
import '../../domain/entities/address_details_request_entity.dart';
import '../../domain/use_cases/add_adderss_use_case.dart';
import '../../domain/use_cases/get_states_use_case.dart';
import '../../domain/use_cases/update_address_use_case.dart';
import 'address_details_state.dart';

@injectable
class AddressDetailsCubit extends Cubit<AddressDetailsState> {
  final AddAddressUseCase _addAddressUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  final GetCitiesUseCase _getCitiesUseCase;
  final GetStatesUseCase _getStatesUseCase;
  final Validator validator;

  AddressDetailsCubit(
    this._addAddressUseCase,
    this._updateAddressUseCase,
    this._getCitiesUseCase,
    this._getStatesUseCase,
    this.validator,
  ) : super(const AddressDetailsState());

  final formKey = GlobalKey<FormState>();
  final MapController mapController = MapController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController recipientsNameController =
      TextEditingController();
  bool isUpdate = false;
  String? addressId;
  Address? originalAddress;

  void doIntent(AddressDetailsAction action) {
    switch (action) {
      case LoadCitiesAndAreasAction():
        _loadCities();
        _loadAreas();

      case SetInitialAddressAction(address: Address address):
        _setInitialAddress(address);

      case SelectAreaAction():
        _updateSelectedAreaId(action.areaId);

      case SelectCityAction():
        _updateSelectedCityId(action.cityId);

      case CameraMovedAction():
        _onCameraMoved(action.position, action.hasGesture);

      case FormChangedAction():
        _validateForm();

      case ButtonPressedAction():
        _buttonPressed();
    }
  }

  Future<void> _loadCities() async {
    final result = await _getCitiesUseCase();
    switch (result) {
      case SuccessResult():
        {
          final cities = result.data;
          String? cityId;
          String? areaId;
          if (state.selectedCityName != null) {
            final matched = cities.firstWhere(
              (c) =>
                  c.cityNameEn?.toLowerCase().trim() ==
                  state.selectedCityName!.toLowerCase().trim(),
              orElse: () => cities.first,
            );
            cityId = matched.id;
            areaId = matched.governorateId;
          }
          final filteredCities =
              areaId != null
                  ? cities.where((c) => c.governorateId == areaId).toList()
                  : cities;
          emit(
            state.copyWith(
              cities: cities,
              filteredCities: filteredCities,
              selectedCityId: cityId,
              selectedAreaId: areaId,
            ),
          );
        }
      case FailureResult():
        {
          emit(state.copyWith(cities: []));
        }
    }
  }

  Future<void> _loadAreas() async {
    final result = await _getStatesUseCase();
    switch (result) {
      case SuccessResult():
        {
          emit(state.copyWith(areas: result.data));
        }
      case FailureResult():
        {
          emit(state.copyWith(areas: []));
        }
    }
  }

  void _setInitialAddress(Address address) {
    originalAddress = address;

    addressId = address.id;
    addressController.text = address.street ?? '';
    phoneNumberController.text = address.phone ?? '';
    recipientsNameController.text = address.username ?? '';

    emit(
      state.copyWith(
        selectedLocation: LatLng(
          double.tryParse(address.lat ?? '') ?? 30.0444,
          double.tryParse(address.long ?? '') ?? 31.2357,
        ),
        selectedCityName: address.city,
      ),
    );
  }

  void _updateSelectedAreaId(String areaId) {
    final filteredCities =
        state.cities.where((city) => city.governorateId == areaId).toList();

    emit(
      state.copyWith(
        selectedAreaId: areaId,
        filteredCities: filteredCities,
        selectedCityId: null,
      ),
    );
  }

  void _updateSelectedCityId(String cityId) {
    final selectedCity = state.filteredCities.firstWhere(
      (city) => city.id == cityId,
    );

    emit(
      state.copyWith(
        selectedCityId: cityId,
        selectedCityName: selectedCity.cityNameEn,
        selectedAreaId: selectedCity.governorateId,
      ),
    );
  }

  void _onCameraMoved(LatLng position, bool hasGesture) {
    if (hasGesture) {
      _getAddressFromLatLng(position.latitude, position.longitude);
      emit(state.copyWith(selectedLocation: position));
    }
  }

  Future<void> _getAddressFromLatLng(double latitude, double longitude) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    Placemark place = placemarks[0];
    addressController.text = place.street ?? '';
  }

  void _validateForm() {
    bool isChanged = true;

    if (isUpdate && originalAddress != null) {
      isChanged = _compareFormValues();
    }

    final isValidNow = formKey.currentState?.validate() ?? false;

    emit(state.copyWith(isFormValid: isValidNow, hasChanged: isChanged));
  }

  bool _compareFormValues() {
    final current = Address(
      id: addressId ?? '',
      street: addressController.text,
      phone: phoneNumberController.text,
      username: recipientsNameController.text,
      city: state.selectedCityName ?? '',
      lat: state.selectedLocation?.latitude.toString(),
      long: state.selectedLocation?.longitude.toString(),
    );
    bool areFieldsEqual(String? a, String? b) =>
        (a ?? '').trim().toLowerCase() == (b ?? '').trim().toLowerCase();

    final isChanged =
        !areFieldsEqual(current.street, originalAddress?.street) ||
        !areFieldsEqual(current.phone, originalAddress?.phone) ||
        !areFieldsEqual(current.username, originalAddress?.username) ||
        !areFieldsEqual(current.city, originalAddress?.city) ||
        current.lat != originalAddress?.lat ||
        current.long != originalAddress?.long;

    return isChanged;
  }

  Future<void> _buttonPressed() async {
    final request = AddressDetailsRequestEntity(
      street: addressController.text,
      phone: phoneNumberController.text,
      city: state.selectedCityName ?? '',
      lat: state.selectedLocation?.latitude.toString() ?? '',
      long: state.selectedLocation?.longitude.toString() ?? '',
      username: recipientsNameController.text,
    );

    if (isUpdate) {
      await _updateAddressDetails(request, addressId ?? '');
    } else {
      await _addAddressDetails(request);
    }
  }

  Future<void> _addAddressDetails(AddressDetailsRequestEntity request) async {
    emit(state.copyWith(addressDetailsState: BaseLoadingState()));
    final result = await _addAddressUseCase(request);
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(addressDetailsState: BaseSuccessState()));

      case FailureResult():
        emit(
          state.copyWith(
            addressDetailsState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _updateAddressDetails(
    AddressDetailsRequestEntity request,
    String id,
  ) async {
    emit(state.copyWith(addressDetailsState: BaseLoadingState()));
    final result = await _updateAddressUseCase(id, request);
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(addressDetailsState: BaseSuccessState()));

      case FailureResult():
        emit(
          state.copyWith(
            addressDetailsState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  @override
  Future<void> close() {
    addressController.dispose();
    phoneNumberController.dispose();
    recipientsNameController.dispose();
    mapController.dispose();
    return super.close();
  }
}
