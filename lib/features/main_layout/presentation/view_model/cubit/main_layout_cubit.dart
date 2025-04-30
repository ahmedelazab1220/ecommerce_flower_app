import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/bottom_nav_bar_visibility/scroll_visibility_controller.dart';
import '../../../../cart/presentation/view/screens/cart_screen.dart';
import '../../../../categories/presentation/view/screens/categories_screen.dart';
import '../../../../home/presentation/view/home_screen.dart';
import '../../../../profile/presentation/view/profile_screen.dart';

part 'main_layout_state.dart';

@injectable
class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial()) {
    _initTabs();
  }

  final scrollVisibilityController = ScrollVisibilityController();
  MainLayoutTabs currentTab = MainLayoutTabs.home;

  late final Map<MainLayoutTabs, Widget Function()> tabs;

  @override
  Future<void> close() async {
    scrollVisibilityController.dispose();
    await super.close();
  }

  void _initTabs() {
    tabs = {
      MainLayoutTabs.home:
          () => HomeScreen(
            scrollVisibilityController: scrollVisibilityController,
          ),
      MainLayoutTabs.categories:
          () => CategoriesScreen(
            scrollVisibilityController: scrollVisibilityController,
          ),
      MainLayoutTabs.cart: () => const CartScreen(),
      MainLayoutTabs.profile:
          () => ProfileScreen(
            scrollVisibilityController: scrollVisibilityController,
          ),
    };
  }

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

    tabs[MainLayoutTabs.categories] =
        () => CategoriesScreen(
          categoryIndex: categoryIndex,
          scrollVisibilityController: scrollVisibilityController,
        );

    emit(ScreenChangedState());

    Future.delayed(const Duration(milliseconds: 100), () {
      tabs[MainLayoutTabs.categories] = () => const CategoriesScreen();
    });
  }

  void _changeSelectedTab(MainLayoutTabs selectedTab) {
    if (currentTab != selectedTab) {
      currentTab = selectedTab;
      emit(ScreenChangedState());
    }
  }
}
