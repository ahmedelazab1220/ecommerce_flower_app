part of 'saved_address_cubit.dart';

class SavedAddressState extends Equatable {
  final BaseState? getSavedAddressState;
  final BaseState? deleteSavedAddressState;

  const SavedAddressState({
    this.getSavedAddressState,
    this.deleteSavedAddressState,
  });

  SavedAddressState copyWith({
    BaseState? getSavedAddressState,
    BaseState? deleteSavedAddressState,
  }) {
    return SavedAddressState(
      getSavedAddressState: getSavedAddressState ?? this.getSavedAddressState,
      deleteSavedAddressState:
          deleteSavedAddressState ?? this.deleteSavedAddressState,
    );
  }

  @override
  List<Object?> get props => [getSavedAddressState, deleteSavedAddressState];
}

sealed class SavedAddressAction {}

final class GetSavedAddressesAction extends SavedAddressAction {}

final class DeleteSavedAddressAction extends SavedAddressAction {
  final String addressId;
  final int index;

  DeleteSavedAddressAction({required this.addressId, required this.index});
}
