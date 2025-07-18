part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BaseState? categories;
  final BaseState? occasions;
  final BaseState? bestSellers;
  final BaseState? navigationState;

  const HomeState({
    this.categories,
    this.occasions,
    this.bestSellers,
    this.navigationState,
  });

  HomeState copyWith({
    BaseState? categories,
    BaseState? occasions,
    BaseState? bestSellers,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      occasions: occasions ?? this.occasions,
      bestSellers: bestSellers ?? this.bestSellers,
    );
  }

  @override
  List<Object?> get props => [
    categories,
    occasions,
    bestSellers,
    navigationState,
  ];
}

sealed class HomeAction {}

final class GetHomeDataAction extends HomeAction {}

final class GetLocation extends HomeAction {}
