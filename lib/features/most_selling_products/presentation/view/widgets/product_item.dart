import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/assets/app_icons.dart';
import 'package:ecommerce_flower_app/core/utils/font_responsive/font_responsive.dart';
import 'package:ecommerce_flower_app/core/utils/responsive_util/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/domain/entity/best_seller_product_entity.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';

class ProductItem extends StatelessWidget {
  final BestSellerProductEntity productEntity;

  const ProductItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white[AppColors.colorCode70]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: ResponsiveUtil.getResponsiveAspectRatioValue(
                context,
                tallAspectRatio: 130,
                standardAspectRatio: 120,
                wideAspectRatio: 110,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(color: AppColors.lightPink),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: Center(
                  child: CachedNetworkImage(imageUrl: productEntity.imgCover!),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productEntity.title!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: FontResponsive.getResponsiveFontSize(
                        context: context,
                        fontSize: 12,
                      ),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        '${LocaleKeys.EGP.tr()} ${productEntity.priceAfterDiscount}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: FontResponsive.getResponsiveFontSize(
                            context: context,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${productEntity.price}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: FontResponsive.getResponsiveFontSize(
                            context: context,
                            fontSize: 12,
                          ),
                          color: AppColors.gray,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${productEntity.discount}%',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: FontResponsive.getResponsiveFontSize(
                            context: context,
                            fontSize: 12,
                          ),
                          color: AppColors.successGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(LocaleKeys.AddToCart.tr()),
              icon: SvgPicture.asset(
                AppIcons.shoppingCartSvg,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
