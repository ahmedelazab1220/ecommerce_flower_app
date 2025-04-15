import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_lotties.dart';
import '../../../../../core/utils/font_responsive/font_responsive.dart';
import '../../../../../core/utils/responsive_util/responsive_util.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../../domain/entity/best_seller_entity.dart';
import '../../view_model/home_cubit.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bestSellerEntity});

  final BestSellerEntity? bestSellerEntity;

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<HomeCubit>(context);
    return Skeletonizer(
      enabled: bestSellerEntity == null,
      child: GestureDetector(
        onTap: () {
          viewModel.doIntent(
            NavigateAction(
              routeName: AppRoutes.productDetailsRoute,
              arguments: {'bestSellerEntity': bestSellerEntity},
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ResponsiveUtil.getResponsiveAspectRatioValue(
                context,
                tallAspectRatio: 340,
                standardAspectRatio: 300,
                wideAspectRatio: 240,
              ),
              width: ResponsiveUtil.getResponsiveAspectRatioValue(
                context,
                tallAspectRatio: 300,
                standardAspectRatio: 260,
                wideAspectRatio: 200,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.lightPink,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: bestSellerEntity?.imgCover ?? '',
                  placeholder:
                      (context, url) =>
                          Center(child: Lottie.asset(AppLotties.loading)),
                  errorWidget:
                      (context, url, error) => const Icon(
                        Icons.error,
                        color: AppColors.pink,
                        size: 45,
                      ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.medium,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: ResponsiveUtil.getResponsiveAspectRatioValue(
                  context,
                  tallAspectRatio: 300,
                  standardAspectRatio: 260,
                  wideAspectRatio: 200,
                ),
              ),
              child: Text(
                bestSellerEntity?.title ??
                    LocaleKeys
                        .LoremIpsumDolorSitAmetConsecteturIdSitMorbiOrnareMorbiDuisRhoncusOrciMassa.tr(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: FontResponsive.getResponsiveFontSize(
                    context: context,
                    fontSize: 20,
                  ),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              "${bestSellerEntity?.price} ${LocaleKeys.EGP.tr()}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: FontResponsive.getResponsiveFontSize(
                  context: context,
                  fontSize: 22,
                ),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
