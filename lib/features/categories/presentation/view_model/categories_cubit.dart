import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/product_entity.dart';
import 'package:ecommerce_flower_app/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:ecommerce_flower_app/features/categories/domain/use_cases/get_products_use_case.dart';
import 'package:ecommerce_flower_app/features/categories/presentation/view_model/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetProductsUseCase _getProductsUseCase;
  final String all = LocaleKeys.all.tr();
  late List<CategoryEntity> categories;
  CategoriesCubit(this._getCategoriesUseCase, this._getProductsUseCase)
    : super(
        CategoriesState(
          getCategoriesState: BaseInitialState(),
          getProductsState: BaseInitialState(),
          selectedTabIndex: 0,
        ),
      ) {
    categories = [CategoryEntity(name: all)];
  }

  void _changeCategory(int index) {
    if (index < 0 || index >= categories.length) return;
    emit(state.copyWith(selectedTabIndex: index));
    final selectedCategoryId = index == 0 ? null : categories[index].id;
    doIntent(GetProductsAction(categoryId: selectedCategoryId));
  }

  void doIntent(CategoriesAction intent) {
    switch (intent) {
      case GetCategoriesAction():
        _getCategories(intent.index);
        break;
      case GetProductsAction(categoryId: var categoryId):
        _getProducts(categoryId: categoryId);
        break;
      case ChangeCategoryAction(index: var index):
        _changeCategory(index);
        break;
    }
  }

  Future<void> _getCategories(int? index) async {
    emit(state.copyWith(getCategoriesState: BaseLoadingState()));
    final result = await _getCategoriesUseCase();

    switch (result) {
      case SuccessResult<List<CategoryEntity>>(data: var result):
        categories.addAll(result);
        _changeCategory(index ?? 0);
        emit(
          state.copyWith(
            getCategoriesState: BaseSuccessState<List<CategoryEntity>>(
              data: categories,
            ),
          ),
        );
        break;
      case FailureResult<List<CategoryEntity>>(exception: var result):
        emit(
          state.copyWith(
            getCategoriesState: BaseErrorState(errorMessage: result.toString()),
          ),
        );
        break;
    }
  }

  Future<void> _getProducts({String? categoryId}) async {
    emit(state.copyWith(getProductsState: BaseLoadingState()));
    final result = await _getProductsUseCase(categoryId: categoryId);

    switch (result) {
      case SuccessResult<List<ProductEntity>>(data: var result):
        emit(
          state.copyWith(
            getProductsState: BaseSuccessState<List<ProductEntity>>(
              data: result,
            ),
          ),
        );
        break;
      case FailureResult<List<ProductEntity>>(exception: var result):
        emit(
          state.copyWith(
            getProductsState: BaseErrorState(errorMessage: result.toString()),
          ),
        );
        break;
    }
  }
}
