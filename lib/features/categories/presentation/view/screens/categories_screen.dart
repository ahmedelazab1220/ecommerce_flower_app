import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view/widgets/categories_body.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_cubit.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  final int? categoryIndex;
  const CategoriesScreen({super.key, this.categoryIndex});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final cubit = getIt<CategoriesCubit>();

  @override
  void initState() {
    cubit.doIntent(GetCategoriesAction(index: widget.categoryIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: const SafeArea(child: Scaffold(body: CategoriesBody())),
    );
  }
}
