import 'package:flutter/material.dart';

import '../../../../core/assets/app_colors.dart';

class PaymentMethodSelector extends StatefulWidget {
  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  const PaymentMethodSelector({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.title),
        trailing: Radio(
          value: widget.value,
          fillColor: WidgetStateProperty.all(AppColors.pink),
          activeColor: AppColors.pink,
          groupValue: widget.groupValue,
          onChanged: (newValue) {
            widget.onChanged(newValue!);
          },
        ),
      ),
    );
  }
}
