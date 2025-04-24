import 'package:flutter/material.dart';

class CartErrorView extends StatelessWidget {
  final String error;
  const CartErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error, style: const TextStyle(color: Colors.red)),
    );
  }
}
