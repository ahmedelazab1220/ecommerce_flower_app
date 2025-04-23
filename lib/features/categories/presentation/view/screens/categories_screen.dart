import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/bottom_nav_bar_visibility/scroll_visibility_controller.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view/widgets/categories_body.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_cubit.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: const SafeArea(child: Scaffold(body: CategoriesBody())),
    );
  }
}
