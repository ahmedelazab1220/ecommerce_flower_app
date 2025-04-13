import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/font_responsive/font_responsive.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/responsive_util/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../view_model/home_cubit.dart';

class LocationContainer extends StatefulWidget {
  const LocationContainer({super.key});

  @override
  State<LocationContainer> createState() => _LocationContainerState();
}

class _LocationContainerState extends State<LocationContainer>
    with SingleTickerProviderStateMixin {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = context.read<HomeCubit>();
    _homeCubit.doIntent(GetLocation());
    _homeCubit.doAnimation(vsync: this);
  }

  void _triggerAnimationAndRefreshLocation() {
    _homeCubit.controller.forward();
    _homeCubit.doIntent(GetLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 8.0,
        children: [
          AnimatedBuilder(
            animation: _homeCubit.controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _homeCubit.jumpAnimation.value),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(_homeCubit.flipAnimation.value),
                  child: child,
                ),
              );
            },
            child: InkWell(
              onTap: _triggerAnimationAndRefreshLocation,
              splashColor: AppColors.white,
              child: SvgPicture.asset(
                AppIcons.locationSvg,
                height: ResponsiveUtil.getResponsiveAspectRatioValue(
                  context,
                  tallAspectRatio: 55,
                  standardAspectRatio: 30,
                  wideAspectRatio: 15,
                ),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<String>(
              valueListenable: _homeCubit.locationService.locationMessage,
              builder: (context, value, _) {
                return Row(
                  children: [
                    Expanded(
                      child: PopupMenuButton<String>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(
                            color: Colors.pink,
                            width: 1.0,
                          ),
                        ),
                        color: AppColors.white[AppColors.colorCode50]!,
                        offset: const Offset(0, 40),
                        onSelected: (String newAddress) {
                          _homeCubit.locationService.locationMessage.value =
                              newAddress;
                        },
                        child: Text.rich(
                          TextSpan(
                            text: LocaleKeys.DeliverTo.tr(),
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall!.copyWith(
                              color: AppColors.black[AppColors.colorCode50],
                              fontSize: FontResponsive.getResponsiveFontSize(
                                context: context,
                                fontSize: 20,
                              ),
                            ),
                            children: [
                              TextSpan(
                                text: " $value",
                                style: Theme.of(
                                  context,
                                ).textTheme.titleSmall!.copyWith(
                                  fontSize:
                                      FontResponsive.getResponsiveFontSize(
                                        context: context,
                                        fontSize: 21,
                                      ),
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(Icons.arrow_drop_down, size: 32.r),
                              ),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        itemBuilder: (BuildContext context) {
                          final List<String> addresses = [
                            '2XVP+XC - Sheikh Zayed',
                            'ABC+YZ - Downtown Dubai',
                          ];
                          return addresses.map((String address) {
                            return PopupMenuItem<String>(
                              value: address,
                              child: Text(
                                address,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
