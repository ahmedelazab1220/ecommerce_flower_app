import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/font_responsive/font_responsive.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              imageUrl:
                  'https://ononesoft.cachefly.net/images/products/2025/photo-raw/effects--photo-effects-after.jpg',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget:
                  (context, url, error) =>
                      const Icon(Icons.error, color: AppColors.pink, size: 45),
              height: 45,
            ),
          ),
        ),
        Text(
          LocaleKeys.Flowers.tr(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: FontResponsive.getResponsiveFontSize(
              context: context,
              fontSize: 18.0,
            ),
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
