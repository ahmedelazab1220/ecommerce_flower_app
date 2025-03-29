import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import 'home_shared_title_widget.dart';
import 'occasion_item.dart';

class OccasionListItems extends StatelessWidget {
  const OccasionListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            HomeSharedTitleWidget(
              title: LocaleKeys.Occasion.tr(),
              onPressed: () {},
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 220,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16.0);
                },
                scrollDirection: Axis.horizontal,
                itemCount: 40,
                itemBuilder: (context, index) => const OccasionItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
