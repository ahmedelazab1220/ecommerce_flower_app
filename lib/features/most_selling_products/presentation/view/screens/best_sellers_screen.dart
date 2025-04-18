import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/font_responsive/font_responsive.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/presentation/view/widgets/best_sellers_body.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class BestSellersScreen extends StatelessWidget {
  const BestSellersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: ListTile(
          title: Text(
            LocaleKeys.BestSeller.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: FontResponsive.getResponsiveFontSize(
                context: context,
                fontSize: 25,
              ),
            ),
          ),
          subtitle: Text(
            LocaleKeys.BloomWithOurExquisiteBestSellers.tr(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: FontResponsive.getResponsiveFontSize(
                context: context,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: BestSellersBody(),
      ),
    );
  }
}
