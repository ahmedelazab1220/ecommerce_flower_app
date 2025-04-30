import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/categories_cubit.dart';
import '../../view_model/categories_state.dart';

class BottomSheetFilteration {
  static void showModelBottomSheet(BuildContext context) {
    final viewModel = context.read<CategoriesCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32.0),
          topLeft: Radius.circular(32.0),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    LocaleKeys.SortBy.tr(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.pink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _buildBottomSheetRadioButton(
                    context: context,
                    label: LocaleKeys.LowestPrice.tr(),
                    isSelected:
                        viewModel.selectedOption == LocaleKeys.LowestPrice.tr(),
                    onTap:
                        () => setState(() {
                          viewModel.selectedOption =
                              LocaleKeys.LowestPrice.tr();
                        }),
                  ),
                  _buildBottomSheetRadioButton(
                    context: context,
                    label: LocaleKeys.HighestPrice.tr(),
                    isSelected:
                        viewModel.selectedOption ==
                        LocaleKeys.HighestPrice.tr(),
                    onTap:
                        () => setState(() {
                          viewModel.selectedOption =
                              LocaleKeys.HighestPrice.tr();
                        }),
                  ),
                  _buildBottomSheetRadioButton(
                    context: context,
                    label: LocaleKeys.New.tr(),
                    isSelected: viewModel.selectedOption == LocaleKeys.New.tr(),
                    onTap:
                        () => setState(() {
                          viewModel.selectedOption = LocaleKeys.New.tr();
                        }),
                  ),
                  _buildBottomSheetRadioButton(
                    context: context,
                    label: LocaleKeys.Old.tr(),
                    isSelected: viewModel.selectedOption == LocaleKeys.Old.tr(),
                    onTap:
                        () => setState(() {
                          viewModel.selectedOption = LocaleKeys.Old.tr();
                        }),
                  ),
                  _buildBottomSheetRadioButton(
                    context: context,
                    label: LocaleKeys.Discount.tr(),
                    isSelected:
                        viewModel.selectedOption == LocaleKeys.Discount.tr(),
                    onTap:
                        () => setState(() {
                          viewModel.selectedOption = LocaleKeys.Discount.tr();
                        }),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    LocaleKeys.Price.tr(),
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.pink),
                  ),
                  RangeSlider(
                    values: viewModel.selectedRangeValues,
                    min: Constants.minPriceRange,
                    max: Constants.maxPriceRange,
                    activeColor: AppColors.pink,
                    inactiveColor: AppColors.lightPink,
                    onChanged: (RangeValues newRange) {
                      setState(() {
                        viewModel.selectedRangeValues = newRange;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${viewModel.selectedRangeValues.start.toInt()}'),
                      Text('\$${viewModel.selectedRangeValues.end.toInt()}'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: SvgPicture.asset(AppIcons.filterSvg),
                    label: Text(
                      LocaleKeys.Filter.tr(),
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: AppColors.white),
                    ),
                    onPressed: () {
                      viewModel.doIntent(
                        GetProductsAction(
                          categoryId:
                              viewModel
                                  .categories[viewModel.state.selectedTabIndex]
                                  .id,
                          price: viewModel.selectedRangeValues.end.toInt(),
                          sort: viewModel.selectedOption,
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildBottomSheetRadioButton({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.white[AppColors.colorCode60]!,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.titleMedium),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: AppColors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
