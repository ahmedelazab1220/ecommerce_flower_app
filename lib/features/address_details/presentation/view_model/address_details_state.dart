import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/address_details_request_entity.dart';

class AddressDetailsState extends Equatable {
  final BaseState? addAddressState;
  final BaseState? updateAddressState;

  const AddressDetailsState({this.addAddressState, this.updateAddressState});

  AddressDetailsState copyWith({
    BaseState? addAddressState,
    BaseState? updateAddressState,
  }) {
    return AddressDetailsState(
      addAddressState: addAddressState ?? this.addAddressState,
      updateAddressState: updateAddressState ?? this.updateAddressState,
    );
  }

  @override
  List<Object?> get props => [addAddressState, updateAddressState];
}

sealed class AddressDetailsAction {}

class AddAddressAction extends AddressDetailsAction {
  final AddressDetailsRequestEntity request;

  AddAddressAction(this.request);
}

class UpdateAddressAction extends AddressDetailsAction {
  final AddressDetailsRequestEntity request;
  final String addressId;

  UpdateAddressAction(this.request, this.addressId);
}
