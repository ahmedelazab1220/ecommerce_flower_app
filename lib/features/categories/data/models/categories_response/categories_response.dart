import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final String message;
  final List<Category> categories;

  const CategoriesResponse({required this.message, required this.categories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoriesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
