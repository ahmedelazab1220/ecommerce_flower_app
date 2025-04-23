import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/use_cases/get_cities_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import '../../domain/entities/address_details_request_entity.dart';
import '../../domain/use_cases/add_adderss_use_case.dart';
import '../../domain/use_cases/get_states_use_case.dart';
import '../../domain/use_cases/update_address_use_case.dart';
import 'address_details_state.dart';

@injectable
class AddressDetailsCubit extends Cubit<AddressDetailsState> {
  final AddAdderssUseCase _addAdderssUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  final GetCitiesUseCase _getCitiesUseCase;
  final GetStatesUseCase _getStatesUseCase;

  AddressDetailsCubit(
    this._addAdderssUseCase,
    this._updateAddressUseCase,
    this._getCitiesUseCase,
    this._getStatesUseCase,
  ) : super(const AddressDetailsState());

  final MapController mapController = MapController();
  final LatLng initialPosition = const LatLng(30.0444, 31.2357);
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController recipientsNameController =
      TextEditingController();

  void doIntent(AddressDetailsAction action) {
    switch (action) {
      case AddAddressAction():
        _addAddressDetails(action.request);

      case UpdateAddressAction():
        _updateAddressDetails(action.request, action.addressId);

      case UpdateSelectedLocationAction():
        _updateSelectedLocation(action.selectedLocation);

      case LoadCitiesAndAreasAction():
        _loadCities();
        _loadAreas();

      case UpdateGovernorateIdAction():
        _updateSelectedGovernorateId(action.governorateId);

      case UpdateCityIdAction():
        _updateSelectedCityId(action.cityId);
    }
  }

  void _updateSelectedLocation(LatLng location) {
    emit(state.copyWith(selectedLocation: location));
  }

  Future<void> _addAddressDetails(AddressDetailsRequestEntity request) async {
    emit(state.copyWith(addAddressState: BaseLoadingState()));
    final result = await _addAdderssUseCase(request);
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(addAddressState: BaseSuccessState()));

      case FailureResult():
        emit(
          state.copyWith(
            addAddressState: BaseErrorState(
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
    emit(state.copyWith(updateAddressState: BaseLoadingState()));
    final result = await _updateAddressUseCase(id, request);
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(updateAddressState: BaseSuccessState()));

      case FailureResult():
        emit(
          state.copyWith(
            updateAddressState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _loadCities() async {
    final result = await _getCitiesUseCase();
    switch (result) {
      case SuccessResult():
        {
          emit(
            state.copyWith(cities: result.data, filteredCities: result.data),
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

  void _updateSelectedGovernorateId(String governorateId) {
    emit(
      state.copyWith(
        selectedGovernorateId: governorateId,
        filteredCities:
            state.cities
                .where((city) => city.governorateId == governorateId)
                .toList(),
        selectedCityId: null,
      ),
    );
  }

  void _updateSelectedCityId(String cityId) {
    emit(state.copyWith(selectedCityId: cityId));
  }
}
