import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../cart/presentation/view/cart_screen.dart';
import '../../../../categories/presentation/view/categories_screen.dart';
import '../../../../home/presentation/view/home_screen.dart';
import '../../../../profile/presentation/view/profile_screen.dart';

part 'main_layout_state.dart';

@singleton
class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());

  int currentIndex = 0;

  List<Widget> tabs = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void doIntent(MainLayoutActions action) {
    switch (action) {
      case ChangeSelectedIndex():
        {
          _changeSelectedIndex(action.selectedIndex);
        }
    }
  }

  void _changeSelectedIndex(int selectedIndex) {
    currentIndex = selectedIndex;
    emit(ScreenChangedState());
  }
}
