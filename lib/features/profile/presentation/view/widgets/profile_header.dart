import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flower_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/base/base_state.dart';
import '../../view_model/profile_state.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final isLoading = viewModel.state is BaseLoadingState;
        final photoUrl = viewModel.userData?.photo;
        final firstName = viewModel.userData?.firstName;
        final email = viewModel.userData?.email;

        return Skeletonizer(
          enabled: isLoading || viewModel.userData == null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileImage(photoUrl),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    firstName?.trim().isNotEmpty == true
                        ? firstName!
                        : 'Your Name',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 2),
                  IconButton(
                    icon: SvgPicture.asset(
                      AppIcons.penSvg,
                      height: 24.spMax,
                      width: 24.spMax,
                    ),
                    onPressed: () {
                      // Handle edit button press
                    },
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                email?.trim().isNotEmpty == true
                    ? email!
                    : 'your.email@example.com',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.gray),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileImage(String? photoUrl) {
    if (photoUrl == null || photoUrl.trim().isEmpty) {
      return const CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.white,
        child: Icon(Icons.person, size: 50),
      );
    }
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: photoUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => Container(
              width: 100,
              height: 100,
              color: AppColors.lightGray,
              child: const Center(child: CircularProgressIndicator()),
            ),
        errorWidget:
            (context, url, error) => Container(
              width: 100,
              height: 100,
              color: AppColors.lightGray,
              child: const Icon(Icons.error),
            ),
      ),
    );
  }
}
