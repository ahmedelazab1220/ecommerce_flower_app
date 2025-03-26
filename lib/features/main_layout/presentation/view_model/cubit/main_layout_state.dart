part of 'main_layout_cubit.dart';

sealed class MainLayoutState {}

final class MainLayoutInitial extends MainLayoutState {}

final class ScreenChangedState extends MainLayoutState {}

sealed class MainLayoutActions {}

final class ChangeSelectedIndex extends MainLayoutActions {
  final int selectedIndex;

  ChangeSelectedIndex(this.selectedIndex);
}
