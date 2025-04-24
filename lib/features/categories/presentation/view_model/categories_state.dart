import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  final BaseState? getCategoriesState;
  final BaseState? getProductsState;
  final int selectedTabIndex;

  const CategoriesState({
    this.getCategoriesState,
    this.getProductsState,
    this.selectedTabIndex = 0,
  });

  CategoriesState copyWith({
    BaseState? getCategoriesState,
    BaseState? getProductsState,
    int? selectedTabIndex,
  }) {
    return CategoriesState(
      getCategoriesState: getCategoriesState ?? this.getCategoriesState,
      getProductsState: getProductsState ?? this.getProductsState,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object?> get props => [
    getCategoriesState,
    getProductsState,
    selectedTabIndex,
  ];
}

sealed class CategoriesAction {}

final class GetCategoriesAction extends CategoriesAction {
  final int? index;
  GetCategoriesAction({this.index});
}

final class GetProductsAction extends CategoriesAction {
  final String? categoryId;
  final int? price;
  final String? sort;
  GetProductsAction({this.categoryId, this.price, this.sort});
}

final class ChangeCategoryAction extends CategoriesAction {
  final int index;

  ChangeCategoryAction(this.index);
}
