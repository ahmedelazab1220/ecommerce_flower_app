import 'package:another_stepper/another_stepper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';

class StepperIndicator extends StatefulWidget {
  final int currentStep;

  const StepperIndicator({super.key, required this.currentStep});

  @override
  State<StepperIndicator> createState() => _StepperIndicatorState();
}

class _StepperIndicatorState extends State<StepperIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnotherStepper(
      stepperList: [
        StepperData(
          title: StepperText(
            LocaleKeys.ReceivedYourOrder.tr(),
            textStyle: const TextStyle(color: AppColors.black),
          ),
          subtitle: StepperText(LocaleKeys.YourOrderHasBeenPlaced.tr()),
          iconWidget: _iconStepper(1),
        ),
        StepperData(
          title: StepperText(
            LocaleKeys.PreparingYourOrder.tr(),
            textStyle: const TextStyle(color: AppColors.black),
          ),
          subtitle: StepperText(LocaleKeys.YourOrderIsBeingPrepared.tr()),
          iconWidget: _iconStepper(2),
        ),
        StepperData(
          title: StepperText(
            LocaleKeys.OutForDelivery.tr(),
            textStyle: const TextStyle(color: AppColors.black),
          ),
          subtitle: StepperText(
            LocaleKeys.OurDeliveryExecutiveIsOnTheWayToDeliverYourItem.tr(),
          ),
          iconWidget: _iconStepper(3),
        ),
        StepperData(
          title: StepperText(
            LocaleKeys.Delivered.tr(),
            textStyle: const TextStyle(color: AppColors.black),
          ),
          iconWidget: _iconStepper(4),
        ),
      ],
      stepperDirection: Axis.vertical,
      iconWidth: 40,
      iconHeight: 40,
      inActiveBarColor: AppColors.gray,
      activeBarColor: AppColors.pink,
      activeIndex: widget.currentStep,
      verticalGap: 22,
    );
  }

  Widget _iconStepper(int step) {
    return widget.currentStep >= step
        ? const Icon(Icons.radio_button_checked, color: AppColors.pink)
        : const Icon(Icons.radio_button_off, color: AppColors.gray);
  }
}
