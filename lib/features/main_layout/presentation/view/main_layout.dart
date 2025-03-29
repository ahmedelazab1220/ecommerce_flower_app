import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_icons.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../view_model/cubit/main_layout_cubit.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final viewModel = getIt<MainLayoutCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<MainLayoutCubit, MainLayoutState>(
        builder: (context, state) {
          return Scaffold(
            body: viewModel.tabs[viewModel.currentTab],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.currentTab.index,
              onTap: (value) {
                viewModel.doIntent(
                  ChangeSelectedTab(MainLayoutTabs.values[value]),
                );
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.homeSvg),
                  label: LocaleKeys.Home.tr(),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.categoriesSvg),
                  label: LocaleKeys.Categories.tr(),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.shoppingCartSvg),
                  label: LocaleKeys.Cart.tr(),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.personSvg),
                  label: LocaleKeys.Profile.tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
