import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/responsive_util/responsive_util.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../domain/entity/best_seller_entity.dart';
import '../../view_model/home_cubit.dart';
import 'best_seller_item.dart';
import 'home_shared_title_widget.dart';

class BestSellerListItems extends StatelessWidget {
  const BestSellerListItems({super.key, required this.bestSellers});

  final List<BestSellerEntity> bestSellers;

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<HomeCubit>(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Skeletonizer(
          enabled: bestSellers.isEmpty,
          child: Column(
            children: [
              HomeSharedTitleWidget(
                title: LocaleKeys.BestSeller.tr(),
                onPressed: () {
                  viewModel.doIntent(
                    NavigateToBestSellerScreenAction(
                      routeName: AppRoutes.bestSellerRoute,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: ResponsiveUtil.getResponsiveHeightValue(
                  context,
                  tablet: 0.29,
                  largeMobile: 0.31,
                  mobile: 0.28,
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16.0);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: bestSellers.isEmpty ? 5 : bestSellers.length,
                  itemBuilder:
                      (context, index) => BestSellerItem(
                        bestSellerEntity:
                            bestSellers.isEmpty ? null : bestSellers[index],
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
