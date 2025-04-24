import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/bottom_nav_bar_visibility/scroll_visibility_controller.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../core/utils/shared_models/product_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import '../../domain/use_cases/get_products_use_case.dart';
import 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetProductsUseCase _getProductsUseCase;

  RangeValues selectedRangeValues = const RangeValues(
    Constants.minPriceRange,
    Constants.maxPriceRange,
  );

  String selectedOption = LocaleKeys.HighestPrice.tr();
  late List<CategoryEntity> categories;
  late ScrollVisibilityController scrollVisibilityController;
  final scrollController = ScrollController();

  CategoriesCubit(this._getCategoriesUseCase, this._getProductsUseCase)
    : super(
        CategoriesState(
          getCategoriesState: BaseInitialState(),
          getProductsState: BaseInitialState(),
          selectedTabIndex: 0,
        ),
      ) {
    categories = [CategoryEntity(name: LocaleKeys.all.tr())];
  }

  void _changeCategory(int index) {
    if (index < 0 || index >= categories.length) index = 0;
    emit(state.copyWith(selectedTabIndex: index));
    final selectedCategoryId = index == 0 ? null : categories[index].id;
    doIntent(GetProductsAction(categoryId: selectedCategoryId));
  }

  @override
  Future<void> close() async {
    scrollController.dispose();
    super.close();
  }

  void doIntent(CategoriesAction action) {
    switch (action) {
      case GetCategoriesAction():
        {
          _getCategories(action.index);
        }
      case GetProductsAction():
        {
          _getProducts(
            categoryId: action.categoryId,
            price: action.price,
            sort: action.sort,
          );
        }
      case ChangeCategoryAction():
        {
          _changeCategory(action.index);
        }
    }
  }

  Future<void> _getCategories(int? index) async {
    emit(state.copyWith(getCategoriesState: BaseLoadingState()));
    final result = await _getCategoriesUseCase();

    switch (result) {
      case SuccessResult<List<CategoryEntity>>():
        {
          categories.addAll(result.data);
          _changeCategory(index ?? 0);
          emit(
            state.copyWith(
              getCategoriesState: BaseSuccessState<List<CategoryEntity>>(
                data: categories,
              ),
            ),
          );
        }
      case FailureResult<List<CategoryEntity>>():
        {
          emit(
            state.copyWith(
              getCategoriesState: BaseErrorState(
                errorMessage: result.exception.toString(),
              ),
            ),
          );
        }
    }
  }

  Future<void> _getProducts({
    String? categoryId,
    int? price,
    String? sort,
  }) async {
    emit(state.copyWith(getProductsState: BaseLoadingState()));
    final result = await _getProductsUseCase(
      categoryId: categoryId,
      price: price,
      sort: sort,
    );

    switch (result) {
      case SuccessResult<List<ProductEntity>>():
        {
          emit(
            state.copyWith(
              getProductsState: BaseSuccessState<List<ProductEntity>>(
                data: result.data,
              ),
            ),
          );
        }
      case FailureResult<List<ProductEntity>>():
        {
          emit(
            state.copyWith(
              getProductsState: BaseErrorState(
                errorMessage: result.exception.toString(),
              ),
            ),
          );
        }
    }
  }
}
