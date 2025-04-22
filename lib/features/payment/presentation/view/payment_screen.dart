import 'package:flutter/material.dart';

import '../../../../core/assets/app_colors.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  String _paymentMethod = 'Cash on delivery';
  bool isGift = false;
  String selectedLocation = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Cash on delivery'),
                      trailing: Radio(
                        value: 'Cash on delivery',
                        fillColor: WidgetStateProperty.all(AppColors.pink),
                        activeColor: AppColors.pink,
                        groupValue: _paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _paymentMethod = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Credit card'),
                  trailing: Radio(
                    value: 'Credit card',
                    fillColor: WidgetStateProperty.all(AppColors.pink),
                    activeColor: AppColors.pink,
                    groupValue: _paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Sub Total:'), Text('100\$')],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Delivery Fee:'), Text('10\$')],
              ),
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('110\$', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Switch(
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.pink,
                    value: isGift,
                    onChanged: (value) {
                      setState(() {
                        isGift = value;
                      });
                    },
                  ),
                  const Text(
                    'It is a gift',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.pink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: isGift,
                child: const Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.pink),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.pink),
                        ),
                        labelText: 'Name',
                        hintText: 'Enter the name',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.pink),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.pink),
                        ),
                        labelText: 'Phone number',
                        hintText: 'Enter the phone number',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Deliver To",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.pink),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: AppColors.pink),
                          SizedBox(width: 8),
                          Text(
                            "Add new",
                            style: TextStyle(
                              color: AppColors.pink,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      RadioListTile(
                        title: const Text("Home"),
                        subtitle: const Text("2XVP+XC - Sheikh Zayed"),
                        value: "Home",
                        groupValue: selectedLocation,
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value.toString();
                          });
                        },
                        activeColor: Colors.pink,
                        secondary: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ),
                      RadioListTile(
                        title: const Text("Office"),
                        subtitle: const Text("2XVP+XC - Sheikh Zayed"),
                        value: "Office",
                        groupValue: selectedLocation,
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value.toString();
                          });
                        },
                        activeColor: Colors.pink,
                        secondary: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.pink,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
