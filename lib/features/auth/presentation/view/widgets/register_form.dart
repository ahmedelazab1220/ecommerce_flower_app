import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view/widgets/register_radio_buttons.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view/widgets/register_text_field_section.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_cubit.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_states.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        final registerState = state.registerState;
        if (registerState is BaseLoadingState) {
          AppDialogs.showLoadingDialog(context);
        } else if (registerState is BaseSuccessState) {
          AppDialogs.hideLoading(context);
          context.read<RegisterCubit>().navigateToLogin();
        } else if (registerState is BaseErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailureDialog(
            context,
            message: registerState.errorMessage,
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: context.read<RegisterCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const RegisterTextFieldSection(),
                SizedBox(height: 24.h),

                /// Gender Selection
                BlocBuilder<RegisterCubit, RegisterStates>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.Gender.tr(),
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(color: AppColors.gray),
                          ),
                          SizedBox(width: 40.w),
                          Expanded(
                            child: RegisterRadioTile(
                              labelKey: LocaleKeys.Female.tr(),
                              value: LocaleKeys.Female.tr(),
                            ),
                          ),
                          Expanded(
                            child: RegisterRadioTile(
                              labelKey: LocaleKeys.Male.tr(),
                              value: LocaleKeys.Male.tr(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                /// Terms & Conditions
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: "${LocaleKeys.CreatingAnAccountYouAgreeToOur.tr()}, ",
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      TextSpan(
                        text: LocaleKeys.TermsAndConditions.tr(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 48.h),

                /// Sign-Up Button
                ElevatedButton(
                  onPressed: () {
                    context.read<RegisterCubit>().registerButtonPressed();
                  },
                  child: Text(LocaleKeys.Signup.tr()),
                ),
                SizedBox(height: 16.h),

                /// Already have an account? Login
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: LocaleKeys.AlreadyHaveAnAccount.tr(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(fontSize: 16.sp),
                    children: [
                      TextSpan(
                        text: " ${LocaleKeys.Login.tr()}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.pink,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.pink,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to login screen
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
