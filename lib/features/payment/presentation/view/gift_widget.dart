import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/assets/app_colors.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';

class GiftDetails extends StatefulWidget {
  final bool isGift;
  final ValueChanged<bool> onGiftToggle;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  const GiftDetails({
    super.key,
    required this.isGift,
    required this.onGiftToggle,
    required this.nameController,
    required this.phoneController,
  });

  @override
  State<GiftDetails> createState() => _GiftDetailsState();
}

class _GiftDetailsState extends State<GiftDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Switch(
              activeColor: AppColors.white,
              activeTrackColor: AppColors.pink,
              value: widget.isGift,
              onChanged: widget.onGiftToggle,
            ),
            Text(
              LocaleKeys.ItIsAGift.tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.pink,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Visibility(
          visible: widget.isGift,
          child: Column(
            children: [
              TextField(
                controller: widget.nameController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.pink),
                  ),
                  labelText: LocaleKeys.EnterTheName.tr(),
                  hintText: LocaleKeys.EnterRecipientsName.tr(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: widget.phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.pink),
                  ),
                  labelText: LocaleKeys.PhoneNumber.tr(),
                  hintText: LocaleKeys.EnterThePhoneNumber.tr(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
