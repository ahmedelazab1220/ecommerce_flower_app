import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/features/address_details/presentation/view_model/address_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/address_details_cubit.dart';

class LocationMapView extends StatelessWidget {
  const LocationMapView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AddressDetailsCubit>();

    return BlocBuilder<AddressDetailsCubit, AddressDetailsState>(
      builder: (context, state) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: FlutterMap(
                      mapController: viewModel.mapController,
                      options: MapOptions(
                        initialCenter: state.selectedLocation!,
                        initialZoom: 13,
                        onPositionChanged: (position, hasGesture) {
                          viewModel.doIntent(
                            CameraMovedAction(position.center, hasGesture),
                          );
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: Constants.googleMapUrlTemplate,
                          userAgentPackageName: Constants.agentPackageName,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.location_on,
                    size: 40,
                    color: AppColors.pink,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${LocaleKeys.Lat.tr()}: ${state.selectedLocation!.latitude.toStringAsFixed(4)}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
                ),
                const SizedBox(width: 8),
                Text(
                  '${LocaleKeys.Long.tr()}: ${state.selectedLocation!.longitude.toStringAsFixed(4)}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
