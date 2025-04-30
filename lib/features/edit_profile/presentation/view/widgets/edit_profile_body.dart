import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../profile/domain/entity/user_entity.dart';
import '../../view_model/cubit/edit_profile_cubit.dart';
import 'edit_profile_form.dart';
import 'edit_profile_user_image.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<EditProfileCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: EditProfileUserImage(imageUrl: userEntity.photo),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
          SliverToBoxAdapter(child: EditProfileForm(userEntity: userEntity)),
          const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: viewModel.valid,
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {
                    viewModel.doIntent(EditProfileRequestAction());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    backgroundColor:
                        value
                            ? AppColors.pink
                            : AppColors.white[AppColors.colorCode80]!,
                  ),
                  child: Text(LocaleKeys.Update.tr()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
