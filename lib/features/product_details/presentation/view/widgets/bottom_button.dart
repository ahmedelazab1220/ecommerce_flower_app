import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/product_details_cubit.dart';
import '../../view_model/product_details_state.dart';

class BottomButton extends StatelessWidget {
  final String? productId;
  const BottomButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<ProductDetailsCubit>();
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state.baseState is BaseSuccessState) {
          AppDialogs.showSuccessDialog(
            context,
            message: LocaleKeys.ProductAddedToCartSuccessfully.tr(),
            description: LocaleKeys.DoneTheItemIsNowInYourShoppingCart.tr(),
            firstButtonText: LocaleKeys.Ok.tr(),
          );
        }
        if (state.baseState is BaseErrorState) {
          AppDialogs.showFailureDialog(
            context,
            message: LocaleKeys.AddedToCartFailed.tr(),
            description: (state.baseState as BaseErrorState).errorMessage,
            firstButtonText: LocaleKeys.Ok.tr(),
            secondButtonText: LocaleKeys.TryAgain.tr(),
            secondButtonAction: () {
              Navigator.of(context).pop();
              viewModel.doIntent(AddProductToCartAction(productId ?? ""));
            },
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
          child: ElevatedButton(
            onPressed: () {
              viewModel.doIntent(AddProductToCartAction(productId ?? ""));
            },
            child:
                state.baseState is BaseLoadingState
                    ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: AppColors.white),
                    )
                    : Text(
                      LocaleKeys.AddToCart.tr(),
                      style: const TextStyle(fontSize: 16),
                    ),
          ),
        );
      },
    );
  }
}
