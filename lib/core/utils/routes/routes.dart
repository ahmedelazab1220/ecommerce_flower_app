import 'package:ecommerce_flower_app/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/main_layout/presentation/view/main_layout.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = '/';
  static const String mainLayoutRoute = '/main-layout';
  static const String productDetailsRoute = '/product-details';
  static const String bestSellerRoute = '/best-seller';
  static const String categoriesRoute = '/categories';
  static const String occasionRoute = '/occasion';
  static const String cartRoute = '/cart';

  static Map<String, Widget Function(BuildContext context)> routes = {
    mainLayoutRoute: (context) => const MainLayout(),
    cartRoute: (context) => const CartScreen(),
  };
}
