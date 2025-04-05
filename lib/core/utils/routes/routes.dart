import 'package:ecommerce_flower_app/features/most_selling_products/presentation/view/screens/best_sellers.dart';
import 'package:flutter/material.dart';

import '../../../features/main_layout/presentation/view/main_layout.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = '/';
  static const String mainLayoutRoute = '/main-layout';
  static const String bestSellerRoute = '/best-seller';

  static Map<String, Widget Function(BuildContext context)> routes = {
    mainLayoutRoute: (context) => const MainLayout(),
    bestSellerRoute: (context) => BestSellers(),
  };
}
