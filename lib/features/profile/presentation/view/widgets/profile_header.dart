import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/widgets/default_avatar.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_state.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final photoUrl = viewModel.userData?.photo;
        final firstName = viewModel.userData?.firstName;
        final email = viewModel.userData?.email;

        return Skeletonizer(
          enabled: viewModel.userData == null,
          child: Column(
            children: [
              _buildProfileImage(photoUrl ?? ''),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      firstName?.trim().isNotEmpty == true
                          ? firstName!
                          : 'Your Name',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Flexible(
                    child: IconButton(
                      icon: SvgPicture.asset(AppIcons.penSvg),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.editProfileRoute,
                          arguments: {'userEntity': viewModel.userData},
                        ).then((value) {
                          viewModel.doIntent(ProfileRequestAction());
                        });
                      },
                    ),
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
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileImage(String photoUrl) {
    return CircleAvatar(
      radius: 60,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: photoUrl,
          fit: BoxFit.cover,
          width: 120,
          height: 120,
          placeholder: (context, url) => DefaultAvatarWidget.build(),
          errorWidget: (context, url, error) => DefaultAvatarWidget.build(),
        ),
      ),
    );
  }
}
