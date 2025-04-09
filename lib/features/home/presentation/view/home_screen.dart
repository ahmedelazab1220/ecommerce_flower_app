import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_state.dart';
import '../view_model/home_cubit.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit viewModel = getIt<HomeCubit>();

  @override
  void initState() {
    viewModel.doIntent(GetHomeDataAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is BaseNavigationState) {
            Navigator.of(context).pushNamed(
              (state as BaseNavigationState).route,
              arguments: (state as BaseNavigationState).arguments,
            );
          }
        },
        child: const SafeArea(child: Scaffold(body: HomeBody())),
      ),
    );
  }
}
