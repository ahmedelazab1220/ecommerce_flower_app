import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
    : super(
        HomeState(
          bestSellers: BaseInitialState(),
          categories: BaseInitialState(),
          occasions: BaseInitialState(),
        ),
      );
}
