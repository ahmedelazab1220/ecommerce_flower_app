import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/checkout_cubit.dart';

class DeliveryTimeSection extends StatelessWidget {
  const DeliveryTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutCubit>();
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.DeliveryTime.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  LocaleKeys.Schedule.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    color: AppColors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset(AppIcons.clockSvg),
              const SizedBox(width: 4),
              Expanded(
                child: StreamBuilder<String>(
                  stream: viewModel.currentDateStream(),
                  builder: (context, snapshot) {
                    final isLoading =
                        !snapshot.hasData ||
                        snapshot.connectionState == ConnectionState.waiting;

                    return RichText(
                      text: TextSpan(
                        text: "${LocaleKeys.Instant.tr()}, ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          WidgetSpan(
                            child: Skeletonizer(
                              enabled: isLoading,
                              child: Text(
                                snapshot.hasData
                                    ? "${LocaleKeys.ArriveBy.tr()} ${snapshot.data!}"
                                    : "${LocaleKeys.ArriveBy.tr()} --:--",
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      snapshot.hasData
                                          ? AppColors.successGreen
                                          : Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
