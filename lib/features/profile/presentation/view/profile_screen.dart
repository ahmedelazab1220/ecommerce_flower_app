import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/profile/presentation/view/widgets/guest_mode_section.dart';
import 'package:ecommerce_flower_app/features/profile/presentation/view/widgets/logout_section.dart';
import 'package:ecommerce_flower_app/features/profile/presentation/view/widgets/notification_section.dart';
import 'package:ecommerce_flower_app/features/profile/presentation/view/widgets/order_section.dart';
import 'package:ecommerce_flower_app/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:ecommerce_flower_app/features/profile/presentation/view/widgets/translation_and_about_us_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/app_icons.dart';
import '../../../../core/base/base_state.dart';
import '../view_model/profile_cubit.dart';
import '../view_model/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        create:
            (_) => getIt<ProfileCubit>()..doIntent(GuestStateRequestAction()),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listenWhen:
              (previous, current) => previous.guestState != current.guestState,
          listener: (context, state) {
            final viewModel = context.read<ProfileCubit>();
            if (state.guestState is BaseErrorState) {
              viewModel.doIntent(ProfileRequestAction());
            }
          },
          builder: (context, state) {
            if (state.guestState is BaseLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.guestState is BaseSuccessState) {
              return const GuestModeSection();
            }
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileHeader(),
                    SizedBox(height: 32),
                    OrderSection(),
                    SizedBox(height: 8),
                    NotificationSection(),
                    SizedBox(height: 16),
                    TranslationAndAboutUsSection(),
                    SizedBox(height: 16),
                    LogoutSection(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
