import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../domain/entity/address_entity.dart';
import '../../view_model/cubit/saved_address_cubit.dart';

class SavedAddressItem extends StatefulWidget {
  const SavedAddressItem({super.key, this.addressEntity, required this.index});

  final AddressEntity? addressEntity;
  final int index;

  @override
  State<SavedAddressItem> createState() => _SavedAddressItemState();
}

class _SavedAddressItemState extends State<SavedAddressItem>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    var viewModel = context.read<SavedAddressCubit>();
    viewModel.doAnimation(this);
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<SavedAddressCubit>();

    return AnimatedBuilder(
      animation: viewModel.rockAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(viewModel.rockAnimation.value * 20, 0),
          child: Transform.rotate(
            angle: viewModel.rockAnimation.value * 0.1,
            child: child,
          ),
        );
      },
      child: Skeletonizer(
        enabled: widget.addressEntity == null,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(color: AppColors.gray.withAlpha(75), blurRadius: 4),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.locationSvg),
                      const SizedBox(width: 4),
                      Text(
                        widget.addressEntity?.city ?? LocaleKeys.Cairo.tr(),
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(fontSize: 18.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          viewModel.rockController.forward().then((_) {
                            viewModel.rockController.reverse().then((_) {
                              viewModel.doIntent(
                                DeleteSavedAddressAction(
                                  addressId: widget.addressEntity?.id ?? "",
                                  index: widget.index,
                                ),
                              );
                            });
                          });
                        },
                        child: SvgPicture.asset(AppIcons.trashSvg),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.addressDetailsRoute,
                            arguments: {'addressEntity': widget.addressEntity},
                          );
                        },
                        child: SvgPicture.asset(AppIcons.editSvg),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.addressEntity?.street ?? LocaleKeys.SheikhZayed.tr(),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
