import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/theme/app_theme.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base/base_state.dart';
import '../../view_model/track_order_cubit.dart';
import '../../view_model/track_order_state.dart';
import '../widgets/arrival_section.dart';
import '../widgets/driver_section.dart';
import '../widgets/stepper_indicator.dart';

class TrackOrderScreen extends StatelessWidget {
  final String orderId;
  TrackOrderScreen({super.key, required this.orderId});

  final viewModel = getIt<TrackOrderCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => viewModel..doIntent(TrackOrderRequestAction(orderId)),
      child: BlocBuilder<TrackOrderCubit, TrackOrderState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                LocaleKeys.TrackOrder.tr(),
                style: AppTheme.appTheme.textTheme.bodyLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const ArrivalSection(),
                  const DriverSection(),
                  Expanded(
                    child:
                        state.baseState is BaseLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : StepperIndicator(
                              currentStep: viewModel.currentState,
                            ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
