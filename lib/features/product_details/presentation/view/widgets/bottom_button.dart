import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/product_details_cubit.dart';
import '../../view_model/product_details_state.dart';

class BottomButton extends StatelessWidget {
  final String? productId;
  final emptyString = "";
  const BottomButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProductDetailsCubit>();
    return BlocListener<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state.baseState is BaseErrorState) {
          AppDialogs.hideLoading(context);
          final errorMessage = (state.baseState as BaseErrorState).errorMessage;
          AppDialogs.showFailureDialog(context, message: errorMessage);
        } else if (state.baseState is BaseLoadingState) {
          AppDialogs.showLoadingDialog(context);
        } else if (state.baseState is BaseSuccessState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            context,
            message: LocaleKeys.ProductAddedToCartSuccessfully.tr(),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: Container(
          height: 48.h,
          color: AppColors.white,
          child: ElevatedButton(
            onPressed: () {
              viewModel.doIntent(
                AddProductToCartAction(productId ?? emptyString),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.pink,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            ),
            child: Text(
              LocaleKeys.AddToCart.tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
  }
}
