import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/font_responsive/font_responsive.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';

class LocationContainer extends StatefulWidget {
  const LocationContainer({super.key});

  @override
  State<LocationContainer> createState() => _LocationContainerState();
}

class _LocationContainerState extends State<LocationContainer> {
  String selectedAddress = '2XVP+XC - Sheikh Zayed';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 8.0,
        children: [
          SvgPicture.asset(AppIcons.locationSvg, height: 30.r),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PopupMenuButton<String>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(color: Colors.pink, width: 1.0),
                    ),
                    color: AppColors.white[AppColors.colorCode50]!,
                    offset: const Offset(0, 40),
                    onSelected: (String newAddress) {
                      setState(() {
                        selectedAddress = newAddress;
                      });
                    },
                    child: Text.rich(
                      TextSpan(
                        text: LocaleKeys.DeliverTo.tr(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.black[AppColors.colorCode50],
                          fontSize: FontResponsive.getResponsiveFontSize(
                            context: context,
                            fontSize: 18.0,
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: " $selectedAddress",
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall!.copyWith(
                              fontSize: FontResponsive.getResponsiveFontSize(
                                context: context,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(Icons.arrow_drop_down, size: 30.r),
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
            ),
          ),
        ],
      ),
    );
  }
}
