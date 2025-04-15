import 'package:bloc/bloc.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/profile/domain/usecase/get_user_data_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../domain/entity/user_data_entity.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUsecase _getUserDataUsecase;
  bool isNotification = false;
  UserDataEntity? userData;

  ProfileCubit(this._getUserDataUsecase)
    : super(ProfileState(baseState: BaseInitialState(), isNotification: false));

  Future<void> _getUserData() async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _getUserDataUsecase();
    switch (result) {
      case SuccessResult<UserDataEntity>():
        userData = result.data;
        Logger().d("userData: $userData");
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

  void notification(bool value) {
    isNotification = value;
    emit(state.copyWith(isNotification: isNotification));
  }

  void doIntent(ProfileAction action) {
    switch (action) {
      case ProfileRequestAction():
        _getUserData();
    }
  }
}
