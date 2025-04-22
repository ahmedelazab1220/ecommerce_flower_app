import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/payment/presentation/view/paymond_select.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/l10n/locale_keys.g.dart';
import 'delivery_select.dart';
import 'gift_widget.dart';
import 'price.dart';

void main() {
  runApp(const MaterialApp(home: PaymentScreen()));
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  bool isGift = false;
  String selectedLocation = 'Home';
  String _paymentMethod = 'Cash on delivery';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  List<Map<String, String>> paymentMethods = [
    {"title": LocaleKeys.CashOnDelivery.tr(), "value": "Cash on delivery"},
    {"title": LocaleKeys.CreditCard.tr(), "value": "Credit card"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Payment.tr())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  LocaleKeys.PaymentMethod.tr(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Column(
                children:
                    paymentMethods.map((method) {
                      return PaymentMethodSelector(
                        title: method["title"]!,
                        value: method["value"]!,
                        groupValue: _paymentMethod,
                        onChanged: (newValue) {
                          setState(() {
                            _paymentMethod = newValue;
                          });
                        },
                      );
                    }).toList(),
              ),
              const PriceSummary(subTotal: 100, deliveryFee: 10),
              GiftDetails(
                isGift: isGift,
                onGiftToggle: (value) {
                  setState(() {
                    isGift = value;
                  });
                },
                nameController: _nameController,
                phoneController: _phoneController,
              ),
              DeliverySelection(
                selectedLocation: selectedLocation,
                onLocationChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
