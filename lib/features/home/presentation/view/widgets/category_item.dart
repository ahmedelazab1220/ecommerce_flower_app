import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_lotties.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/font_responsive/font_responsive.dart';
import '../../../../../core/utils/responsive_util/responsive_util.dart';
import '../../../domain/entity/category_entity.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryEntity});

  final CategoryEntity? categoryEntity;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: categoryEntity == null,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.lightPink,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: categoryEntity?.image ?? '',
                placeholder: (context, url) => Lottie.asset(AppLotties.loading),
                errorWidget:
                    (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.pink,
                      size: 45,
                    ),
                height: ResponsiveUtil.getResponsiveAspectRatioValue(
                  context,
                  tallAspectRatio: 100,
                  standardAspectRatio: 80,
                  wideAspectRatio: 60,
                ),
                width: ResponsiveUtil.getResponsiveAspectRatioValue(
                  context,
                  tallAspectRatio: 100,
                  standardAspectRatio: 80,
                  wideAspectRatio: 60,
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveUtil.getResponsiveAspectRatioValue(
                context,
                tallAspectRatio: 135,
                standardAspectRatio: 98,
                wideAspectRatio: 124,
              ),
            ),
            child: Text(
              categoryEntity?.name ?? LocaleKeys.Jewelries.tr(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: FontResponsive.getResponsiveFontSize(
                  context: context,
                  fontSize: 24,
                ),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
