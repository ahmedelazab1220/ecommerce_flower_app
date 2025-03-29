import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/font_responsive/font_responsive.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://s3-alpha-sig.figma.com/img/8b1e/d75d/ebaee33a9b4bee3eedd43305de2ab671?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PzDEWZcAK2u6W7FsXXRGKCCUQ4VGhOK7XCP0jdiNHOd3z~qjQ5Ae4h3xBzQwX0rGA45gKMN95GUo4Yy~VlurmxaFCYpWFmjS7xgxov5Ow41B4YdgF9GBjv2uWYM7WPaIEUlcpb8XEwPIUYaisDih3mNCdo2yatx5eeNRM8g0w8HjVbVto0osZf8LP9eDU8EuTYxbLaPPXfuImaUaP6vcRRp4H1tcYJukm9UdtgOEaRxD4AnRfA0P7lRGV5pmVPyYh4oiEUm48z34BKSA5Co48IJv-pLNWzww1DW~0OuAiN7wy45b6wbuYxAlvEDJaaRgRvyUm10-3qmi8OS7xS2vAg__',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget:
              (context, url, error) =>
                  const Icon(Icons.error, color: AppColors.pink, size: 45),
          height: 170,
        ),
        const SizedBox(height: 8.0),
        Text(
          LocaleKeys.Sunny.tr(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: FontResponsive.getResponsiveFontSize(
              context: context,
              fontSize: 18.0,
            ),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4.0),
        Text(
          "600 ${LocaleKeys.EGP.tr()}",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: FontResponsive.getResponsiveFontSize(
              context: context,
              fontSize: 21.0,
            ),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
