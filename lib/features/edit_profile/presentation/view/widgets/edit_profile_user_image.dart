import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/widgets/default_avatar.dart';
import '../../view_model/cubit/edit_profile_cubit.dart';

class EditProfileUserImage extends StatefulWidget {
  const EditProfileUserImage({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  State<EditProfileUserImage> createState() => _EditProfileUserImageState();
}

class _EditProfileUserImageState extends State<EditProfileUserImage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  late EditProfileCubit viewModel = context.read<EditProfileCubit>();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile == null) {
      return;
    }

    setState(() {
      _imageFile = File(pickedFile.path);
    });

    viewModel.doIntent(UploadProfileImageRequestAction(image: _imageFile!));
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: AppColors.pink),
              title: Text(LocaleKeys.TakeAPhoto.tr()),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: AppColors.green),
              title: Text(LocaleKeys.ChooseFromGallery.tr()),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 60,
            child: ClipOval(
              child:
                  _imageFile != null
                      ? Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      )
                      : widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                      ? CachedNetworkImage(
                        imageUrl: widget.imageUrl!,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                        errorWidget:
                            (context, url, error) =>
                                DefaultAvatarWidget.build(),
                      )
                      : DefaultAvatarWidget.build(),
            ),
          ),
          Positioned(
            bottom: -4,
            right: -1,
            child: GestureDetector(
              onTap: _showImageSourceDialog,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.white[AppColors.colorCode90]!,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
