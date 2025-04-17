import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/assets/app_icons.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white[AppColors.colorCode70]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColors.lightPink),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: product.imgCover ?? '',
                      errorWidget:
                          (context, url, error) => const Icon(
                            Icons.error,
                            color: AppColors.pink,
                            size: 45,
                          ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Center(
                      child: Text(
                        '${LocaleKeys.EGP.tr()} ${product.priceAfterDiscount}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${product.price}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.gray,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${product.discount}%',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.successGreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 6),
              ),
              label: Text(
                LocaleKeys.AddToCart.tr(),
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.white,
                  fontSize: 13,
                ),
              ),
              icon: SvgPicture.asset(
                AppIcons.shoppingCartSvg,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
