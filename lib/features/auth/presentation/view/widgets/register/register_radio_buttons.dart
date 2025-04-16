import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_cubit.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/register/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<RegisterCubit, RegisterStates>(
      buildWhen:
          (previous, current) =>
              previous.selectedGender != current.selectedGender,
      builder: (context, state) {
        return RadioListTile<String>(
          title: Text(
            labelKey.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color:
                  state.selectedGender == value
                      ? AppColors.black
                      : AppColors.gray,
            ),
          ),
          value: value,
          groupValue: state.selectedGender,
          activeColor: AppColors.pink,
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          onChanged: (newValue) {
            context.read<RegisterCubit>().doIntent(
              GenderChangedAction(gender: newValue!),
            );
          },
        );
      },
    );
  }
}
