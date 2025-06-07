import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/responsive_util/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../domain/entity/occasion_entity.dart';
import 'home_shared_title_widget.dart';
import 'occasion_item.dart';

class OccasionListItems extends StatelessWidget {
  const OccasionListItems({super.key, required this.occasions});

  final List<OccasionEntity> occasions;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Skeletonizer(
          enabled: occasions.isEmpty,
          child: Column(
            children: [
              HomeSharedTitleWidget(
                title: LocaleKeys.Occasion.tr(),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.occasionRoute,
                    arguments: {'occasionIndex': 1},
                  );
                },
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: ResponsiveUtil.getResponsiveHeightValue(
                  context,
                  tablet: 0.27,
                  largeMobile: 0.31,
                  mobile: 0.26,
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16.0);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: occasions.isEmpty ? 5 : occasions.length,
                  itemBuilder:
                      (context, index) => OccasionItem(
                        occasionEntity:
                            occasions.isEmpty ? null : occasions[index],
                        occasionIndex: index + 1,
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
