import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/address_details_cubit.dart';
import '../../view_model/address_details_state.dart';
import 'address_details_form.dart';
import 'location_map_view.dart';

class AddressDetailsBody extends StatelessWidget {
  const AddressDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AddressDetailsCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LocationMapView(),
            const SizedBox(height: 16),
            const AddressDetailsForm(),
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
      ),
    );
  }
}
