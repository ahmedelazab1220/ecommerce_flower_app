import 'package:flutter/material.dart';

import '../../../features/main_layout/presentation/view/main_layout.dart';
import '../../../features/product_details/presentation/view/screens/product_details_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = '/';
  static const String mainLayoutRoute = '/main-layout';
  static const String productDetailsRoute = '/product-details';

  static Map<String, Widget Function(BuildContext context)> routes = {
    mainLayoutRoute: (context) => const MainLayout(),
    productDetailsRoute: (context) => const ProductDetailsScreen(),
  };
}
