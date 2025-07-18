import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/address_details_cubit.dart';
import '../../view_model/address_details_state.dart';

class DropdownButtons extends StatelessWidget {
  const DropdownButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AddressDetailsCubit>();
    final isEn = context.locale == const Locale(Constants.en);
    return BlocBuilder<AddressDetailsCubit, AddressDetailsState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                dropdownColor: AppColors.white,
                validator:
                    (value) =>
                        viewModel.validator.validateCityName(value ?? ''),
                value:
                    state.selectedCityId != null &&
                            state.filteredCities.any(
                              (city) => city.id == state.selectedCityId,
                            )
                        ? state.selectedCityId
                        : null,
                decoration: InputDecoration(
                  labelText: LocaleKeys.City.tr(),
                  hintText: LocaleKeys.City.tr(),
                ),
                items:
                    state.filteredCities.map((city) {
                      return DropdownMenuItem<String>(
                        value: city.id,
                        child: Text(
                          (isEn ? city.cityNameEn : city.cityNameAr) ?? '',
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    viewModel.doIntent(SelectCityAction(value));
                    viewModel.doIntent(FormChangedAction());
                  }
                },
              ),
            ),
            const SizedBox(width: 17),
            Expanded(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                dropdownColor: AppColors.white,
                validator:
                    (value) =>
                        viewModel.validator.validateAreaName(value ?? ''),
                value:
                    state.selectedAreaId != null &&
                            state.areas.any(
                              (area) => area.id == state.selectedAreaId,
                            )
                        ? state.selectedAreaId
                        : null,
                decoration: InputDecoration(
                  labelText: LocaleKeys.Area.tr(),
                  hintText: LocaleKeys.Area.tr(),
                ),
                items:
                    state.areas.map((area) {
                      return DropdownMenuItem<String>(
                        value: area.id,
                        child: Text(
                          (isEn
                                  ? area.governorateNameEn
                                  : area.governorateNameAr) ??
                              '',
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    viewModel.doIntent(SelectAreaAction(value));
                    viewModel.doIntent(FormChangedAction());
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
