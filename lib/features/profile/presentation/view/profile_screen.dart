import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../edit_profile/domain/entity/user_entity.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.editProfileRoute,
              arguments: {
                'userEntity': UserEntity(
                  firstName: 'Ahmed',
                  lastName: 'Elazab',
                  email: 'ahmedelazab1229@gmail.com',
                  gender: 'male',
                  phone: '01021006100',
                  photo: '',
                ),
              },
            );
          },
          child: const Text('Profile Screen'),
        ),
      ),
    );
  }
}
