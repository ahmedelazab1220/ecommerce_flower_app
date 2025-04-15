import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../cart/presentation/view/screens/cart_screen.dart';
import '../../../../categories/presentation/view/categories_screen.dart';
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
        {
          _changeSelectedTab(action.selectedTab);
        }
    }
  }

  void _changeSelectedTab(MainLayoutTabs selectedTab) {
    if (currentTab != selectedTab) {
      currentTab = selectedTab;
      emit(ScreenChangedState());
    }
  }
}
