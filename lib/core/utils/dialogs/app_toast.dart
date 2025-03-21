import 'package:flutter/material.dart';

import '../../assets/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String title, required Color color}) {
  Fluttertoast.showToast(
    msg: title,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: AppColors.white,
    fontSize: 16.0,
  );
}
