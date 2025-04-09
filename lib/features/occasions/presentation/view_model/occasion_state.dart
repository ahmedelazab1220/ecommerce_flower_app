part of 'occasion_cubit.dart';

class OccasionState extends Equatable {
  final BaseState? baseState;

  const OccasionState({this.baseState});

  OccasionState copyWith({BaseState? baseState}) {
    return OccasionState(baseState: baseState ?? this.baseState);
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class OccasionAction {}

class OccasionRequestAction extends OccasionAction {}

class ProductsRequestAction extends OccasionAction {
  final String occasionId;

  ProductsRequestAction(this.occasionId);
}
