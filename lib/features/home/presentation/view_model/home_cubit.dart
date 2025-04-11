import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/location_service/location_service.dart';
import '../../domain/entity/home_response_entity.dart';
import '../../domain/use_case/get_home_data_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase _getHomeDataUseCase;
  final LocationService locationService;

  HomeCubit(this._getHomeDataUseCase, this.locationService)
    : super(
        HomeState(
          bestSellers: BaseInitialState(),
          categories: BaseInitialState(),
          occasions: BaseInitialState(),
        ),
      );

  @override
  Future<void> close() async {
    locationService.dispose();
    await super.close();
  }

  void doIntent(HomeAction action) {
    switch (action) {
      case NavigateAction():
        {
          _navigateToScreen(
            routeName: action.routeName,
            arguments: action.arguments,
          );
        }
      case GetLocation():
        {
          locationService.getLocation();
        }
      case GetHomeDataAction():
        {
          _getHomeData();
        }
    }
  }

  Future<void> _getHomeData() async {
    emit(
      state.copyWith(
        bestSellers: BaseLoadingState(),
        categories: BaseLoadingState(),
        occasions: BaseLoadingState(),
      ),
    );
    var response = await _getHomeDataUseCase.call();
    switch (response) {
      case SuccessResult<HomeResponseEntity>():
        {
          emit(
            state.copyWith(
              bestSellers: BaseSuccessState(data: response.data.bestSeller!),
              categories: BaseSuccessState(data: response.data.categories!),
              occasions: BaseSuccessState(data: response.data.occasions!),
            ),
          );
        }
      case FailureResult<HomeResponseEntity>():
        {
          emit(
            state.copyWith(
              bestSellers: BaseErrorState(
                errorMessage: response.exception.toString(),
                exception: response.exception,
              ),
              categories: BaseErrorState(
                errorMessage: response.exception.toString(),
                exception: response.exception,
              ),
              occasions: BaseErrorState(
                errorMessage: response.exception.toString(),
                exception: response.exception,
              ),
            ),
          );
        }
    }
  }

  void _navigateToScreen({required String routeName, dynamic arguments}) {
    emit(
      state.copyWith(
        navigationState: BaseNavigationState(routeName, arguments),
      ),
    );
  }
}
