import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/edit_profile/domain/entity/user_entity.dart';
import 'package:ecommerce_flower_app/features/edit_profile/presentation/view/widgets/edit_profile_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/cubit/edit_profile_cubit.dart';
import 'edit_profile_change_password.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<EditProfileCubit>();
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Form(
          onChanged: () => viewModel.doIntent(FormDataChanged()),
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: viewModel.firstNameController,
                      validator:
                          (value) =>
                              viewModel.validator.validateName(value ?? ""),
                      decoration: InputDecoration(
                        labelText: LocaleKeys.FirstName.tr(),
                      ),
                      onTapOutside:
                          (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                  const SizedBox(width: 17.0),
                  Expanded(
                    child: TextFormField(
                      controller: viewModel.lastNameController,
                      validator:
                          (value) =>
                              viewModel.validator.validateName(value ?? ""),
                      decoration: InputDecoration(
                        labelText: LocaleKeys.LastName.tr(),
                      ),
                      onTapOutside:
                          (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: viewModel.emailController,
                validator:
                    (value) => viewModel.validator.validateEmail(value ?? ""),
                decoration: InputDecoration(labelText: LocaleKeys.Email.tr()),
                onTapOutside:
                    (event) => FocusManager.instance.primaryFocus?.unfocus(),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: viewModel.phoneController,
                validator:
                    (value) =>
                        viewModel.validator.validatePhoneNumber(value ?? ""),
                decoration: InputDecoration(
                  labelText: LocaleKeys.PhoneNumber.tr(),
                ),
                onTapOutside:
                    (event) => FocusManager.instance.primaryFocus?.unfocus(),
              ),
              const SizedBox(height: 24.0),
              const EditProfileChangePassword(),
              const SizedBox(height: 24.0),
              EditProfileGender(gender: userEntity.gender),
            ],
          ),
        );
      },
    );
  }
}
