import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../cart/presentation/view/screens/cart_screen.dart';
import '../../../../categories/presentation/view/screens/categories_screen.dart';
import '../../../../home/presentation/view/home_screen.dart';
import '../../../../profile/presentation/view/profile_screen.dart';

part 'main_layout_state.dart';

@singleton
class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());

  MainLayoutTabs currentTab = MainLayoutTabs.home;

  final Map<MainLayoutTabs, Widget> tabs = {
    MainLayoutTabs.home: const HomeScreen(),
    MainLayoutTabs.categories: const CategoriesScreen(),
    MainLayoutTabs.cart: const CartScreen(),
    MainLayoutTabs.profile: const ProfileScreen(),
  };

  void doIntent(MainLayoutActions action) {
    switch (action) {
      case ChangeSelectedTab():
        _changeSelectedTab(action.selectedTab);
        break;

      case ChangeTabWithCategoryIndex():
        _changeTabWithCategoryIndex(action.selectedTab, action.categoryIndex);
        break;
    }
  }

  void _changeTabWithCategoryIndex(
    MainLayoutTabs selectedTab,
    int categoryIndex,
  ) {
    currentTab = selectedTab;

    tabs[MainLayoutTabs.categories] = CategoriesScreen(
      categoryIndex: categoryIndex,
    );

    emit(ScreenChangedState());

    Future.delayed(const Duration(milliseconds: 100), () {
      tabs[MainLayoutTabs.categories] = const CategoriesScreen();
    });
  }

  void _changeSelectedTab(MainLayoutTabs selectedTab) {
    if (currentTab != selectedTab) {
      currentTab = selectedTab;
      emit(ScreenChangedState());
    }
  }
}
