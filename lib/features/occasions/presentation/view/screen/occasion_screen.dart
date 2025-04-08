import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../../../../core/utils/di/di.dart';
import '../../view_model/occasion_cubit.dart';

class OccasionScreen extends StatelessWidget {
  const OccasionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<OccasionCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            viewModel.getAllOccasions();
          },
          child: Text("Get All Occasions"),
        ),
      ),
    );
  }
}
