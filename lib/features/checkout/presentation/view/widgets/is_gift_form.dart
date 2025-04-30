import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/checkout_cubit.dart';

class IsGiftForm extends StatelessWidget {
  const IsGiftForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutCubit>();
    return Form(
      key: viewModel.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: viewModel.nameController,
              validator:
                  (value) => viewModel.validator.validateName(value ?? ""),
              decoration: InputDecoration(
                labelText: LocaleKeys.Name.tr(),
                hintText: LocaleKeys.EnterTheName.tr(),
              ),
              onTapOutside:
                  (event) => FocusManager.instance.primaryFocus?.unfocus(),
            ),
            const SizedBox(height: 24),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: viewModel.phoneController,
              validator:
                  (value) =>
                      viewModel.validator.validatePhoneNumber(value ?? ""),
              decoration: InputDecoration(
                labelText: LocaleKeys.PhoneNumber.tr(),
                hintText: LocaleKeys.EnterThePhoneNumber.tr(),
              ),
              onTapOutside:
                  (event) => FocusManager.instance.primaryFocus?.unfocus(),
            ),
          ],
        ),
      ),
    );
  }
}
