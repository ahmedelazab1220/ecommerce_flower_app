import 'package:bloc/bloc.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/profile/domain/usecase/get_user_data_usecase.dart';
import 'package:ecommerce_flower_app/features/profile/domain/usecase/guest_mode_use_case.dart';
import 'package:ecommerce_flower_app/features/profile/domain/usecase/logout_use_case.dart';
import 'package:ecommerce_flower_app/features/profile/presentation/view_model/profile_state.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/user_data_entity.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUsecase _getUserDataUsecase;
  final LogoutUseCase _logoutUseCase;
  final GuestModeUseCase _guestModeUseCase;
  String? token;
  bool isNotification = false;
  UserDataEntity? userData;

  ProfileCubit(
    this._getUserDataUsecase,
    this._logoutUseCase,
    this._guestModeUseCase,
  ) : super(ProfileState(baseState: BaseInitialState(), isNotification: false));

  Future<void> _getUserData() async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _getUserDataUsecase();
    switch (result) {
      case SuccessResult<UserDataEntity>():
        userData = result.data;
        emit(
          state.copyWith(
            baseState: BaseSuccessState<UserDataEntity>(data: result.data),
          ),
        );
      case FailureResult<UserDataEntity>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _logout() async {
    emit(state.copyWith(logoutState: BaseLoadingState()));
    final result = await _logoutUseCase();
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(logoutState: BaseSuccessState()));
      case FailureResult():
        emit(
          state.copyWith(
            logoutState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _isGuestUser() async {
    emit(state.copyWith(guestState: BaseLoadingState()));
    token = await _guestModeUseCase.call();
    if (token == null || token!.isEmpty) {
      emit(state.copyWith(guestState: BaseSuccessState()));
    } else {
      emit(
        state.copyWith(
          guestState: BaseErrorState(errorMessage: "You are not a guest user"),
        ),
      );
    }
  }

  void notification(bool value) {
    isNotification = value;
    emit(state.copyWith(isNotification: isNotification));
  }

  void doIntent(ProfileAction action) {
    switch (action) {
      case ProfileRequestAction():
        _getUserData();
      case LogoutRequestAction():
        _logout();
      case GuestStateRequestAction():
        _isGuestUser();
    }
  }
}
