part of 'occasion_cubit.dart';

class OccasionState extends Equatable {
  final BaseState? baseState;
  final int selectedTabIndex;

  const OccasionState({this.baseState, this.selectedTabIndex = 0});

  OccasionState copyWith({BaseState? baseState, int? selectedTabIndex}) {
    return OccasionState(
      baseState: baseState ?? this.baseState,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object?> get props => [baseState, selectedTabIndex];
}

sealed class OccasionAction {}

class OccasionRequestAction extends OccasionAction {
  final int? index;
  OccasionRequestAction({this.index});
}

class ProductsRequestAction extends OccasionAction {
  final String occasionId;

  ProductsRequestAction(this.occasionId);
}

class ChangeOccasionTabAction extends OccasionAction {
  final int tabIndex;

  ChangeOccasionTabAction(this.tabIndex);
}
