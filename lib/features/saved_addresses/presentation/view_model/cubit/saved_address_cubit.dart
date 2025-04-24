import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/datasource_excution/api_result.dart';
import '../../../domain/entity/address_entity.dart';
import '../../../domain/use_case/delete_user_address_use_case.dart';
import '../../../domain/use_case/get_user_saved_addresses_use_case.dart';

part 'saved_address_state.dart';

@injectable
class SavedAddressCubit extends Cubit<SavedAddressState> {
  final GetUserSavedAddressesUseCase _getSavedAddressesUseCase;
  final DeleteUserAddressUseCase _deleteUserAddressUseCase;

  SavedAddressCubit(
    this._getSavedAddressesUseCase,
    this._deleteUserAddressUseCase,
  ) : super(SavedAddressState(getSavedAddressState: BaseInitialState()));

  List<AddressEntity>? savedAddresses = [];
  late AnimationController rockController;
  late Animation<double> rockAnimation;

  void doIntent(SavedAddressAction action) {
    switch (action) {
      case GetSavedAddressesAction():
        {
          _getSavedAddresses();
        }
      case DeleteSavedAddressAction():
        {
          _deleteSavedAddress(action.addressId, action.index);
        }
    }
  }

  void _getSavedAddresses() async {
    emit(state.copyWith(getSavedAddressState: BaseLoadingState()));
    final response = await _getSavedAddressesUseCase.call();
    switch (response) {
      case SuccessResult<List<AddressEntity>?>():
        {
          savedAddresses = response.data;
          emit(state.copyWith(getSavedAddressState: BaseSuccessState()));
        }
      case FailureResult<List<AddressEntity>?>():
        {
          emit(
            state.copyWith(
              getSavedAddressState: BaseErrorState(
                errorMessage: response.exception.toString(),
                exception: response.exception,
              ),
            ),
          );
        }
    }
  }

  void _deleteSavedAddress(String addressId, int index) async {
    emit(state.copyWith(deleteSavedAddressState: BaseLoadingState()));
    final response = await _deleteUserAddressUseCase.call(addressId: addressId);
    switch (response) {
      case SuccessResult<List<AddressEntity>?>():
        {
          savedAddresses?.removeAt(index);
          emit(state.copyWith(deleteSavedAddressState: BaseSuccessState()));
        }
      case FailureResult<List<AddressEntity>?>():
        {
          emit(
            state.copyWith(
              deleteSavedAddressState: BaseErrorState(
                errorMessage: response.exception.toString(),
                exception: response.exception,
              ),
            ),
          );
        }
    }
  }

  void doAnimation(TickerProvider vsync) {
    rockController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    );
    rockAnimation = Tween<double>(
      begin: 0,
      end: 0.1,
    ).animate(CurvedAnimation(parent: rockController, curve: Curves.easeInOut));
  }

  @override
  Future<void> close() async {
    rockController.dispose();
    super.close();
  }
}
