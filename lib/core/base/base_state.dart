sealed class BaseState {}

class BaseInitialState extends BaseState {}

class BaseSuccessState<T> extends BaseState {
  T? data;

  BaseSuccessState({this.data});
}

class BaseLoadingState extends BaseState {}

class BaseHideLoadingState extends BaseState {}

class BaseErrorState extends BaseState {
  String errorMessage;
  Exception? exception;

  BaseErrorState({required this.errorMessage, this.exception});
}

enum NavigationType { push, pushReplacement, pop }
