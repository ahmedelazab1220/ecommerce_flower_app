part of 'occasion_cubit.dart';

class OccasionState extends Equatable {
  final BaseState? occasionState;
  final BaseState? productsState;
  final int selectedTabIndex;

  const OccasionState({
    this.occasionState,
    this.selectedTabIndex = 0,
    this.productsState,
  });

  OccasionState copyWith({
    BaseState? occasionState,
    BaseState? productsState,
    int? selectedTabIndex,
  }) {
    return OccasionState(
      occasionState: occasionState ?? this.occasionState,
      productsState: productsState ?? this.productsState,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object?> get props => [occasionState, selectedTabIndex, productsState];
}

sealed class OccasionAction {}

class OccasionRequestAction extends OccasionAction {
  final int? index;
  OccasionRequestAction({this.index});
}

class ChangeOccasionTabAction extends OccasionAction {
  final int tabIndex;

  ChangeOccasionTabAction(this.tabIndex);
}
