import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/address_details_request_entity.dart';
import '../../domain/use_cases/add_adderss_use_case.dart';
import '../../domain/use_cases/update_address_use_case.dart';
import 'address_details_state.dart';

@injectable
class AddressDetailsCubit extends Cubit<AddressDetailsState> {
  final AddAdderssUseCase _addAdderssUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  AddressDetailsCubit(this._addAdderssUseCase, this._updateAddressUseCase)
    : super(const AddressDetailsState());

  void doIntent(AddressDetailsAction action) {
    switch (action) {
      case AddAddressAction():
        _addAddressDetails(action.request);

      case UpdateAddressAction():
        _updateAddressDetails(action.request, action.addressId);
    }
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
}
