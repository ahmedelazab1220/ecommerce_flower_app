import 'package:ecommerce_flower_app/features/search/domain/usecase/search_usecase.dart';
import 'package:ecommerce_flower_app/features/search/presentation/view_model/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/product_entity.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final TextEditingController searchController = TextEditingController();
  final SearchUsecase _searchUsecase;

  SearchCubit(this._searchUsecase)
    : super(SearchState(baseState: BaseInitialState()));

  void doIntent(SearchAction action) {
    switch (action) {
      case SearchRequestAction():
        _search(action.keyword);
    }
  }

  Future<void> _search(String keyword) async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final result = await _searchUsecase(keyword: keyword);
    switch (result) {
      case SuccessResult<List<ProductEntity>>():
        emit(state.copyWith(baseState: BaseSuccessState(data: result.data)));
      case FailureResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            baseState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  @override
  Future<void> close() async {
    searchController.dispose();
    await super.close();
  }
}
