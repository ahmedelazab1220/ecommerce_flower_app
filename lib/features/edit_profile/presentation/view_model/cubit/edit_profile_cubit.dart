import 'dart:io';

import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../profile/domain/entity/user_entity.dart';
import '../../../domain/entity/edit_profile/edit_profile_request.dart';
import '../../../domain/use_case/edit_profile_use_case.dart';
import '../../../domain/use_case/upload_profile_image_use_case.dart';

part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  final UploadProfileImageUseCase _uploadProfileImageUseCase;
  final Validator validator;

  EditProfileCubit(
    this._editProfileUseCase,
    this._uploadProfileImageUseCase,
    this.validator,
  ) : super(
        EditProfileState(
          editProfileState: BaseInitialState(),
          uploadProfileImageState: BaseInitialState(),
          lastActionType: EditProfileActionType.none,
        ),
      );

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier valid = ValueNotifier(false);
  late UserEntity userEntity;

  @override
  Future<void> close() async {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    valid.dispose();
    super.close();
  }

  void doIntent(EditProfileAction action) async {
    switch (action) {
      case FormDataChanged():
        {
          _formDataChanged();
        }
      case EditProfileRequestAction():
        {
          _editProfile();
        }
      case UploadProfileImageRequestAction():
        {
          _uploadProfileImage(image: action.image);
        }
    }
  }

  Future<void> _editProfile() async {
    if (formKey.currentState!.validate()) {
      emit(
        state.copyWith(
          editProfileState: BaseLoadingState(),
          lastActionType: EditProfileActionType.editProfile,
        ),
      );
      final result = await _editProfileUseCase.call(
        request: EditProfileRequest(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
        ),
      );
      switch (result) {
        case SuccessResult<void>():
          emit(state.copyWith(editProfileState: BaseSuccessState()));
        case FailureResult<void>():
          emit(
            state.copyWith(
              editProfileState: BaseErrorState(
                errorMessage: result.exception.toString(),
                exception: result.exception,
              ),
            ),
          );
      }
    }
  }

  Future<void> _uploadProfileImage({required File image}) async {
    emit(
      state.copyWith(
        uploadProfileImageState: BaseLoadingState(),
        lastActionType: EditProfileActionType.uploadImage,
      ),
    );
    final result = await _uploadProfileImageUseCase.call(image: image);
    switch (result) {
      case SuccessResult<void>():
        emit(state.copyWith(uploadProfileImageState: BaseSuccessState()));
      case FailureResult<void>():
        emit(
          state.copyWith(
            uploadProfileImageState: BaseErrorState(
              errorMessage: result.exception.toString(),
              exception: result.exception,
            ),
          ),
        );
    }
  }

  void _formDataChanged() {
    final isFormValid = formKey.currentState!.validate();
    final areFieldsFilled =
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;

    final hasDataChanged =
        emailController.text.trim() != userEntity.email ||
        phoneController.text.trim() != userEntity.phone ||
        firstNameController.text.trim() != userEntity.firstName ||
        lastNameController.text.trim() != userEntity.lastName;

    valid.value = isFormValid && areFieldsFilled && hasDataChanged;
  }
}
