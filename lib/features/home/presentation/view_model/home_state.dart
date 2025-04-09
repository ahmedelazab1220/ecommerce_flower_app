part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BaseState? categories;
  final BaseState? occasions;
  final BaseState? bestSellers;

  const HomeState({this.categories, this.occasions, this.bestSellers});

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
  List<Object?> get props => [categories, occasions, bestSellers];
}

sealed class HomeAction {}

final class GetHomeDataAction extends HomeAction {}

final class GetLocation extends HomeAction {}

final class NavigateToBestSellerScreenAction extends HomeAction {
  final String routeName;
  NavigateToBestSellerScreenAction({required this.routeName});
}

final class NavigateToProductDetailsScreenAction extends HomeAction {
  final String routeName;
  final dynamic arguments;
  NavigateToProductDetailsScreenAction({
    required this.routeName,
    this.arguments,
  });
}

final class NavigateToCategoriesScreenAction extends HomeAction {
  final String routeName;
  final dynamic arguments;
  NavigateToCategoriesScreenAction({required this.routeName, this.arguments});
}

final class NavigateToOccasionsScreenAction extends HomeAction {
  final String routeName;
  final dynamic arguments;
  NavigateToOccasionsScreenAction({required this.routeName, this.arguments});
}
