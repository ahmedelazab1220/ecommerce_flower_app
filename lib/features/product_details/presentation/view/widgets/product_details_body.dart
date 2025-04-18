import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/shared_models/product_entity.dart';

class ProductDetailsBody extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "${LocaleKeys.EGP} ${product.price ?? ""}",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text.rich(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${LocaleKeys.Status.tr()}: ",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextSpan(
                        text: LocaleKeys.InStock.tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Flexible(
                child: Text(
                  LocaleKeys.AllPricesIncludeTax.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13.0,
                    color: AppColors.gray,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                child: Text(
                  product.title ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Flexible(
                child: Text(
                  LocaleKeys.Description.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product.description ?? "",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
