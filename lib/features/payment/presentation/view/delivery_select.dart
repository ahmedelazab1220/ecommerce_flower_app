import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/l10n/locale_keys.g.dart';
import 'add_new_button.dart';
import 'button_next.dart';

class DeliverySelection extends StatefulWidget {
  final String selectedLocation;
  final ValueChanged<String> onLocationChanged;

  const DeliverySelection({
    super.key,
    required this.selectedLocation,
    required this.onLocationChanged,
  });

  @override
  State<DeliverySelection> createState() => _DeliverySelectionState();
}

class _DeliverySelectionState extends State<DeliverySelection> {
  final List<Map<String, String>> locations = [
    {"title": "Home", "subtitle": "2XVP+XC - Sheikh Zayed"},
    {"title": "Office", "subtitle": "2XVP+XC - Sheikh Zayed"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.DeliverTo.tr(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const AddNewButton(),
        const SizedBox(height: 10),
        ListView(
          shrinkWrap: true,
          children:
              locations.map((location) {
                return RadioListTile(
                  title: Text(location["title"]!),
                  subtitle: Text(location["subtitle"]!),
                  value: location["title"]!,
                  groupValue: widget.selectedLocation,
                  onChanged: (value) {
                    widget.onLocationChanged(value.toString());
                  },
                  activeColor: Colors.pink,
                  secondary: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                );
              }).toList(),
        ),
        const NextButton(),
      ],
    );
  }
}
