import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/assets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/domain/entity/best_seller_product_entity.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';

class ProductItem extends StatelessWidget {
  final BestSellerProductEntity productEntity;

  const ProductItem({Key? key, required this.productEntity}) : super(key: key);

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
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.lightPink),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.5),
                child: Center(
                  child: Image.network(
                    productEntity.imgCover,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productEntity.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        'EGP ${productEntity.priceAfterDiscount}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${productEntity.price}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.gray,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 6),
                      // Discount percentage
                      Text(
                        '${productEntity.discount}%',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
