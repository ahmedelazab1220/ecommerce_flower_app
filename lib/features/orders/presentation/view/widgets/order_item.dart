import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view_model/orders_cubit.dart';
import 'package:ecommerce_flower_app/features/orders/presentation/view_model/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/shared_models/product_entity.dart';

class OrderItem extends StatelessWidget {
  final ProductEntity productEntity;
  final String orderId;
  final String orderNumber;
  final String actionText;
  final emptyString = "";

  const OrderItem({
    super.key,
    required this.productEntity,
    required this.orderId,
    required this.orderNumber,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white[AppColors.colorCode90]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 130,
                color: AppColors.lightPink,
                child: CachedNetworkImage(
                  imageUrl: productEntity.imgCover ?? emptyString,
                  fit: BoxFit.cover,
                  errorWidget:
                      (context, url, error) => const Icon(
                        Icons.error,
                        color: AppColors.pink,
                        size: 40,
                      ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      productEntity.title ?? emptyString,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${LocaleKeys.EGP.tr()} ${productEntity.price}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${LocaleKeys.OrderNumber.tr()} $orderNumber",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.white[AppColors.colorCode90],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (actionText == LocaleKeys.Reorder.tr()) {
                          context.read<OrdersCubit>().doIntent(
                            AddToCartAction(productEntity.id!),
                          );
                        }
                      },
                      child: Text(
                        actionText,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
