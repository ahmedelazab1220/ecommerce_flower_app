import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/features/address_details/presentation/view/widgets/dropdown_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/assets/app_colors.dart';
import '../../view_model/address_details_cubit.dart';
import '../../view_model/address_details_state.dart';

class AddressDetailsForm extends StatelessWidget {
  const AddressDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AddressDetailsCubit>();

    return Form(
      key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () => viewModel.doIntent(FormChangedAction()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: viewModel.addressController,
            validator:
                (value) => viewModel.validator.validateAddress(value ?? ''),
            decoration: InputDecoration(
              labelText: LocaleKeys.Address.tr(),
              hintText: LocaleKeys.EnterTheAddress.tr(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: viewModel.phoneNumberController,
            validator:
                (value) => viewModel.validator.validatePhoneNumber(value ?? ''),
            decoration: InputDecoration(
              labelText: LocaleKeys.PhoneNumber.tr(),
              hintText: LocaleKeys.EnterThePhoneNumber.tr(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: viewModel.recipientsNameController,
            validator: (value) => viewModel.validator.validateName(value ?? ''),
            decoration: InputDecoration(
              labelText: LocaleKeys.RecipientName.tr(),
              hintText: LocaleKeys.EnterRecipientName.tr(),
            ),
          ),
          const SizedBox(height: 16),
          const DropdownButtons(),
          const SizedBox(height: 48),
          BlocBuilder<AddressDetailsCubit, AddressDetailsState>(
            builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor:
                      AppColors.black[AppColors.colorCode30],
                ),
                onPressed:
                    state.isFormValid && state.hasChanged
                        ? () => viewModel.doIntent(ButtonPressedAction())
                        : null,
                child: Text(LocaleKeys.SaveAddress.tr()),
              );
            },
          ),
        ],
      ),
    );
  }
}
