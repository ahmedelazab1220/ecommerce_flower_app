import 'package:ecommerce_flower_app/features/categories/presentation/view/screens/categories_screen.dart';
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

  static Map<String, Widget Function(BuildContext context)> routes = {
    mainLayoutRoute: (context) => const MainLayout(),
    categoriesRoute: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final categoryIndex = args['categoryIndex'] as int;
      return CategoriesScreen(categoryIndex: categoryIndex);
    },
  };
}
