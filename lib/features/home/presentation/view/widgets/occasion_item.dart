import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/font_responsive/font_responsive.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class OccasionItem extends StatelessWidget {
  const OccasionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://s3-alpha-sig.figma.com/img/4b24/9f8f/6da5ecac489dea7ff7be8aff6a26316b?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Sp9DK1r5qVclKzdw8uoq5wHE8c6JBukFjpJa5iiHbW0wpR1I3CXj7RZnEXD~HXOc1BRj76Bu~Y0J5kfaQSGDR572N49-z1xG2NY4-THxMTChJfep20-bUErNXc~qUAYKab0juoMkO0dKWW1vcn866YxZWEIOZ2QbUtH6jIbdgquyu3tQ0cZ2t7GiNemtbKy0I4xUUksZGbfTmwaAMiEXwgpmVz1DrU2eytOmiZ6g0boYzmTGquoPODFCk~nO2SoJv2j7bHPdYIgN6uy9CT1kB419f~E8idXembuushQ~gjHc6933mOAqNwT7QFh1bnQY3ZqRjpfbh8KFBcAlJ1kYqw__',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget:
              (context, url, error) =>
                  const Icon(Icons.error, color: AppColors.pink, size: 45),
          height: 170,
        ),
        const SizedBox(height: 8.0),
        Text(
          LocaleKeys.Wedding.tr(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: FontResponsive.getResponsiveFontSize(
              context: context,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
