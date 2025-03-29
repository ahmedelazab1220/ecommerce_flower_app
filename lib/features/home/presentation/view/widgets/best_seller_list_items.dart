import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import 'best_seller_item.dart';
import 'home_shared_title_widget.dart';

class BestSellerListItems extends StatelessWidget {
  const BestSellerListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            HomeSharedTitleWidget(
              title: LocaleKeys.BestSeller.tr(),
              onPressed: () {},
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 240,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16.0);
                },
                scrollDirection: Axis.horizontal,
                itemCount: 40,
                itemBuilder: (context, index) => const BestSellerItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
