import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final BaseState? baseState;

  const SearchState({this.baseState});

  SearchState copyWith({BaseState? baseState}) {
    return SearchState(baseState: baseState ?? this.baseState);
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class SearchAction {}

class SearchRequestAction extends SearchAction {
  final String keyword;

  SearchRequestAction(this.keyword);
}
