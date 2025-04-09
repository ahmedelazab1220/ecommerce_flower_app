import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/responsive_util/responsive_util.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../domain/entity/category_entity.dart';
import '../../view_model/home_cubit.dart';
import 'category_item.dart';
import 'home_shared_title_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryListItems extends StatelessWidget {
  const CategoryListItems({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<HomeCubit>(context);
    var categoryNames =
        categories
            .takeWhile((element) => element.name != null)
            .map((element) => element.name)
            .toList();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Skeletonizer(
          enabled: categories.isEmpty,
          child: Column(
            children: [
              HomeSharedTitleWidget(
                title: LocaleKeys.Categories.tr(),
                onPressed: () {
                  viewModel.doIntent(
                    NavigateToCategoriesScreenAction(
                      routeName: AppRoutes.categoriesRoute,
                      arguments: categoryNames,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: ResponsiveUtil.getResponsiveHeightValue(
                  context,
                  tablet: 0.14,
                  largeMobile: 0.16,
                  mobile: 0.12,
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16.0);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.isEmpty ? 5 : categories.length,
                  itemBuilder:
                      (context, index) => CategoryItem(
                        categoryEntity:
                            categories.isEmpty ? null : categories[index],
                        categoryNames: categoryNames,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
