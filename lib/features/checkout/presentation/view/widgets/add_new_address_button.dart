import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../view_model/checkout_cubit.dart';
import '../../view_model/checkout_state.dart';

class AddNewAddressButton extends StatelessWidget {
  const AddNewAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<CheckoutCubit>();
    return ElevatedButton.icon(
      onPressed: () async {
        await Navigator.pushNamed(
          context,
          AppRoutes.savedAddressRoute,
        ).then((_) => viewModel.doIntent(GetAddressesAction()));
      },
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.all(AppColors.white),
        side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.lightGray),
        ),
      ),
      icon: SvgPicture.asset(AppIcons.addSvg),
      label: Text(
        LocaleKeys.AddNew.tr(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.pink,
        ),
      ),
    );
  }
}
