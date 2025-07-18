import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/bottom_nav_bar_visibility/scroll_visibility_controller.dart';
import '../view_model/home_cubit.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.scrollVisibilityController});
  final ScrollVisibilityController? scrollVisibilityController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit viewModel = getIt<HomeCubit>();

  @override
  void initState() {
    viewModel.scrollVisibilityController =
        widget.scrollVisibilityController ?? ScrollVisibilityController();
    viewModel.scrollVisibilityController.listen(viewModel.scrollController);
    viewModel.doIntent(GetHomeDataAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: const SafeArea(child: Scaffold(body: HomeBody())),
    );
  }
}
