import 'package:ecommerce_flower_app/features/categories/presentation/view/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/presentation/view/screens/login_screen.dart';
import '../../../features/auth/presentation/view/screens/register_screen.dart';
import '../../../features/main_layout/presentation/view/main_layout.dart';
import '../../../features/occasions/presentation/view/screen/occasion_screen.dart';
import '../../../features/product_details/presentation/view/screens/product_details_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const String initialRoute = '/';
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String home = "/home";
  static const String mainLayoutRoute = '/main-layout';
  static const String bestSellerRoute = '/best-seller';
  static const String categoriesRoute = '/categories';
  static const String occasionRoute = '/occasion';
  static const String productDetailsRoute = '/product-details';

  static Map<String, Widget Function(BuildContext)> routes = {
    loginRoute: (context) => const LoginScreen(),
    registerRoute: (context) => const RegisterScreen(),
    mainLayoutRoute: (context) => const MainLayout(),
    categoriesRoute: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final categoryIndex = args['categoryIndex'] as int;
      return CategoriesScreen(categoryIndex: categoryIndex);
    },
    occasionRoute: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final occasionIndex = args?['occasionIndex'] as int?;
      return OccasionScreen(occasionIndex: occasionIndex);
    },
    productDetailsRoute: (context) => const ProductDetailsScreen(),
  };
}
