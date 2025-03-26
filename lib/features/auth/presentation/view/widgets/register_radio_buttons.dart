import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterRadioTile extends StatelessWidget {
  final String value;
  final String labelKey;

  const RegisterRadioTile({
    super.key,
    required this.value,
    required this.labelKey,
  });

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return RadioListTile<String>(
      title: Text(
        labelKey.tr(),
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14.sp,
              color: registerCubit.selectedGender == value
                  ? AppColors.black
                  : AppColors.gray,
            ),
      ),
      value: value,
      groupValue: registerCubit.selectedGender,
      activeColor: AppColors.pink,
      contentPadding: EdgeInsets.zero,
      onChanged: (newValue) => registerCubit.changeGender(newValue!),
    );
  }
}
