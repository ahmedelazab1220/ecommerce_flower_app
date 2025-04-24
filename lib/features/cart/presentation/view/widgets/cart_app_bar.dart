import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../domain/entity/cart_entity.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CartEntity? cart;
  const CartAppBar({super.key, this.cart});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            LocaleKeys.Cart.tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (cart != null)
            Text(
              " (${cart!.numOfCartItems} ${LocaleKeys.Items.tr()})",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: AppColors.gray),
            ),
        ],
      ),
    );
  }
}
