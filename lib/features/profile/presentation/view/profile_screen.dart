import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/app_icons.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/utils/bottom_nav_bar_visibility/scroll_visibility_controller.dart';
import '../view_model/profile_cubit.dart';
import '../view_model/profile_state.dart';
import 'widgets/guest_mode_section.dart';
import 'widgets/logout_section.dart';
import 'widgets/notification_section.dart';
import 'widgets/order_section.dart';
import 'widgets/profile_header.dart';
import 'widgets/translation_and_about_us_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.scrollVisibilityController});
  final ScrollVisibilityController? scrollVisibilityController;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final viewModel = getIt<ProfileCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.scrollVisibilityController =
        widget.scrollVisibilityController ?? ScrollVisibilityController();
    viewModel.scrollVisibilityController.listen(viewModel.scrollController);

    viewModel.doIntent(GuestStateRequestAction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppIcons.logoSvg),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.notificationSvg),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => viewModel,
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listenWhen:
              (previous, current) => previous.guestState != current.guestState,
          listener: (context, state) {
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
            return CustomScrollView(
              controller: viewModel.scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: const [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileHeader(),
                        SizedBox(height: 28.0),
                        OrderSection(),
                        SizedBox(height: 8.0),
                        NotificationSection(),
                        SizedBox(height: 16.0),
                        TranslationAndAboutUsSection(),
                        SizedBox(height: 16.0),
                        LogoutSection(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
