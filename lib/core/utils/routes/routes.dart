import 'package:flutter/material.dart';

import '../../../features/about_us/presentation/view/about_us_screen.dart';
import '../../../features/auth/presentation/view/screens/login/login_screen.dart';
import '../../../features/auth/presentation/view/screens/register/register_screen.dart';
import '../../../features/categories/presentation/view/screens/categories_screen.dart';
import '../../../features/change_password/presentation/view/screens/change_password_screen.dart';
import '../../../features/edit_profile/presentation/view/edit_profile_screen.dart';
import '../../../features/main_layout/presentation/view/main_layout.dart';
import '../../../features/occasions/presentation/view/screen/occasion_screen.dart';
import '../../../features/product_details/presentation/view/screens/product_details_screen.dart';
import '../../../features/most_selling_products/presentation/view/screens/best_sellers_screen.dart';
import '../../../features/terms_and_conditions/presentation/view/terms_and_conditions_screen.dart';
import '../shared_models/product_entity.dart';

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
  static const String editProfileRoute = '/edit-profile';
  static const String resetPasswordRoute = '/reset-password';
  static const String productDetailsRoute = '/product-details';
  static const String changePasswordRoute = '/change-password';
  static const String termsAndConditionsRoute = '/terms-and-conditions';
  static const String aboutUsRoute = '/about-us';

  static Map<String, Widget Function(BuildContext)> routes = {
    loginRoute: (context) => const LoginScreen(),
    registerRoute: (context) => const RegisterScreen(),
    mainLayoutRoute: (context) => const MainLayout(),
    editProfileRoute: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final userEntity = args['userEntity'];
      return EditProfileScreen(userEntity: userEntity);
    },
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
    productDetailsRoute: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final productEntity = args?['productEntity'] as ProductEntity;
      return ProductDetailsScreen(productEntity: productEntity);
    },
    bestSellerRoute: (context) => const BestSellersScreen(),
    changePasswordRoute: (context) => const ChangePasswordScreen(),
    termsAndConditionsRoute: (context) => const TermsAndConditionsScreen(),
    aboutUsRoute: (context) => const AboutUsScreen(),
  };
}
