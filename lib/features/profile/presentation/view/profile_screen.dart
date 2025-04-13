import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/base/base_state.dart';
import '../view_model/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<ProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.contain,
                child: SvgPicture.asset(AppIcons.logoSvg, height: 40.spMin),
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(
                AppIcons.notificationSvg,
                height: 24.spMax,
                width: 24.spMax,
              ),
              onPressed: () {
                // Handle settings button press
              },
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => viewModel..doIntent(ProfileRequestAction()),
        child: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state.baseState is BaseLoadingState) {
              const Center(child: CircularProgressIndicator());
            } else if (state.baseState is BaseErrorState) {
              final errorState = state.baseState as BaseErrorState;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorState.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state.baseState is BaseSuccessState) {
              final successState = state.baseState as BaseSuccessState;
              // Handle success state, e.g., navigate to another screen or show data
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data loaded successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state.baseState is BaseLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.baseState is BaseErrorState) {
                final errorState = state.baseState as BaseErrorState;
                return Center(
                  child: Text(
                    errorState.errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else if (state.baseState is BaseSuccessState) {
                final successState = state.baseState as BaseSuccessState;
                // Display user data here
                return Center(
                  child: Text(
                    'User Data: ${successState.data}',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
