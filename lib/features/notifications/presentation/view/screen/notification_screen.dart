import 'package:flutter/material.dart';

import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.builder(
        itemCount: 10, // Replace with your notification count
        itemBuilder: (context, index) {
          return const NotificationItem();
        },
      ),
    );
  }
}
