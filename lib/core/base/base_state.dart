sealed class BaseState {}

class BaseInitialState extends BaseState {}

class BaseSuccessState<T> extends BaseState {
  T? data;

  BaseSuccessState({this.data});
}

class BaseLoadingState extends BaseState {}

class BaseHideLoadingState extends BaseState {}

class BaseNavigationState extends BaseState {
  final dynamic arguments;
  final String routeName;
  final bool? replace;
  BaseNavigationState({required this.routeName, this.arguments, this.replace});
}

class BaseErrorState extends BaseState {
  String errorMessage;
  Exception? exception;

  BaseErrorState({required this.errorMessage, this.exception});
}
