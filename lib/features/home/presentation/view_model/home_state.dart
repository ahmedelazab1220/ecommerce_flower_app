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
