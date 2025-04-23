import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/bottom_nav_bar_visibility/scroll_visibility_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/categories_cubit.dart';
import '../../view_model/categories_state.dart';
import '../widgets/bottom_sheet_filteration.dart';
import '../widgets/categories_body.dart';

class CategoriesScreen extends StatefulWidget {
  final int? categoryIndex;
  final ScrollVisibilityController? scrollVisibilityController;
  const CategoriesScreen({
    super.key,
    this.categoryIndex,
    this.scrollVisibilityController,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final viewModel = getIt<CategoriesCubit>();

  @override
  void initState() {
    viewModel.scrollVisibilityController =
        widget.scrollVisibilityController ?? ScrollVisibilityController();
    viewModel.scrollVisibilityController.listen(viewModel.scrollController);
    viewModel.doIntent(GetCategoriesAction(index: widget.categoryIndex));
    viewModel.scrollVisibilityController =
        widget.scrollVisibilityController ?? ScrollVisibilityController();
    viewModel.scrollVisibilityController.listen(viewModel.scrollController);
    viewModel.doIntent(GetCategoriesAction(index: widget.categoryIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const CategoriesBody(),
              ValueListenableBuilder<bool>(
                valueListenable: viewModel.scrollVisibilityController.isVisible,
                builder: (context, isVisible, child) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isVisible ? 1.0 : 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          BottomSheetFilteration.showModelBottomSheet(context);
                        },
                        icon: SvgPicture.asset(AppIcons.filterSvg),
                        label: Text(
                          LocaleKeys.Filter.tr(),
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
