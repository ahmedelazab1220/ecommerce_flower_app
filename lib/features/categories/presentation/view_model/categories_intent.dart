sealed class CategoriesIntent {}

class GetCategoriesIntent extends CategoriesIntent {}

class GetProductsIntent extends CategoriesIntent {
  final String? categoryId;

  GetProductsIntent({this.categoryId});
}

class ChangeCategoryIntent extends CategoriesIntent {
  final int index;

  ChangeCategoryIntent(this.index);
}
