part of 'main_layout_cubit.dart';

sealed class MainLayoutState {}

final class MainLayoutInitial extends MainLayoutState {}

final class ScreenChangedState extends MainLayoutState {}

sealed class MainLayoutActions {}

final class ChangeSelectedTab extends MainLayoutActions {
  final MainLayoutTabs selectedTab;

  ChangeSelectedTab(this.selectedTab);
}

final class ChangeTabWithCategoryIndex extends MainLayoutActions {
  final MainLayoutTabs selectedTab;
  final int categoryIndex;

  ChangeTabWithCategoryIndex(this.selectedTab, this.categoryIndex);
}

enum MainLayoutTabs { home, categories, cart, profile }
