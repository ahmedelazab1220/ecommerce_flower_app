import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/assets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../domain/entity/products_entity.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity? productEntity;
  final bool isLoading;

  const ProductItem({
    super.key,
    required this.productEntity,
    this.isLoading = false,
  });

  final emptyString = "";

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
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
                decoration: const BoxDecoration(color: AppColors.lightPink),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: productEntity?.imgCover ?? emptyString,
                      placeholder: (context, url) => const SizedBox.shrink(),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productEntity?.title ?? emptyString,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          '${LocaleKeys.EGP.tr()} ${productEntity?.priceAfterDiscount ?? emptyString}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${productEntity?.price ?? emptyString}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            color: AppColors.gray,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${productEntity?.discount ?? emptyString}%',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.successGreen),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(padding: const EdgeInsets.all(8)),
                onPressed: () {},
                label: Text(
                  LocaleKeys.AddToCart.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
      ),
    );
  }
}
