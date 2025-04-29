import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_images.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/categories_cubit.dart';
import '../../view_model/categories_state.dart';

class HandleEmptyProductItems extends StatelessWidget {
  const HandleEmptyProductItems({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<CategoriesCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            AppImages.noProductsAvailableLogoImage,
            height: 150,
            width: 150,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          LocaleKeys.OopsNoProductsFound.tr(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.black[AppColors.colorCode90],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          LocaleKeys.TryAdjustingYourFiltersOrExploreOtherCategories.tr(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.black[AppColors.colorCode40],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                if (viewModel.selectedRangeValues.start ==
                        Constants.minPriceRange &&
                    viewModel.selectedRangeValues.end ==
                        Constants.maxPriceRange &&
                    viewModel.selectedOption == LocaleKeys.HighestPrice.tr()) {
                  return;
                }
                viewModel.selectedOption = LocaleKeys.HighestPrice.tr();
                viewModel.selectedRangeValues = const RangeValues(
                  Constants.minPriceRange,
                  Constants.maxPriceRange,
                );
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
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                side: BorderSide(color: AppColors.pink[AppColors.colorCode50]!),
              ),
              child: Text(
                LocaleKeys.ClearFilters.tr(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.pink[AppColors.colorCode50],
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                viewModel.doIntent(ChangeCategoryAction(0));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pink[AppColors.colorCode50],
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              child: Text(
                LocaleKeys.ExploreCategories.tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
