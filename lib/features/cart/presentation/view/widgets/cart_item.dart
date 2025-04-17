import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/assets/app_icons.dart';
import 'package:ecommerce_flower_app/features/cart/domain/entity/cart_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/assets/app_lotties.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/cart_cubit.dart';
import '../../view_model/cart_state.dart';

class CartItem extends StatelessWidget {
  final CartProductEntity cartProductEntity;

  const CartItem({super.key, required this.cartProductEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white[AppColors.colorCode90]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: 100,
                color: AppColors.lightPink,
                child: CachedNetworkImage(
                  imageUrl: cartProductEntity.imgCover,
                  fit: BoxFit.cover,
                  errorWidget:
                      (context, url, error) => const Icon(
                        Icons.error,
                        color: AppColors.pink,
                        size: 40,
                      ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartProductEntity.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              cartProductEntity.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartCubit>().doIntent(
                            DeleteProductFromCartAction(cartProductEntity.id),
                          );
                        },
                        icon: SvgPicture.asset(AppIcons.trashSvg),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${LocaleKeys.EGP.tr()} : ${cartProductEntity.price * cartProductEntity.quantity}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (cartProductEntity.quantity > 1) {
                                context.read<CartCubit>().doIntent(
                                  UpdateProductInCartAction(
                                    cartProductEntity.id,
                                    cartProductEntity.quantity - 1,
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            cartProductEntity.quantity.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<CartCubit>().doIntent(
                                UpdateProductInCartAction(
                                  cartProductEntity.id,
                                  cartProductEntity.quantity + 1,
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
