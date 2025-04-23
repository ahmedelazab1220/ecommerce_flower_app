import 'package:flutter/material.dart';

import '../../../features/auth/presentation/view/screens/login_screen.dart';
import '../../../features/auth/presentation/view/screens/register_screen.dart';
import '../../../features/categories/presentation/view/screens/categories_screen.dart';
import '../../../features/change_password/presentation/view/screens/change_password_screen.dart';
import '../../../features/checkout/presentation/view/screen/checkout_screen.dart';
import '../../../features/checkout/presentation/view/widgets/track_order_success_screen.dart';
import '../../../features/edit_profile/presentation/view/edit_profile_screen.dart';
import '../../../features/main_layout/presentation/view/main_layout.dart';
import '../../../features/occasions/presentation/view/screen/occasion_screen.dart';
import '../../../features/product_details/presentation/view/screens/product_details_screen.dart';
import '../../../features/most_selling_products/presentation/view/screens/best_sellers_screen.dart';
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
  static const String checkoutRoute = '/checkout';
  static const String trackOrderSuccessRoute = '/track-order-success';
  static const String paymentWebViewRoute = '/payment-web-view';

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
      final productEntity =
          ModalRoute.of(context)?.settings.arguments as ProductEntity;
      return ProductDetailsScreen(productEntity: productEntity);
    },
    bestSellerRoute: (context) => const BestSellersScreen(),
    changePasswordRoute: (context) => const ChangePasswordScreen(),
    checkoutRoute: (context) => const CheckoutScreen(),
    trackOrderSuccessRoute: (context) => const TrackOrderSuccessScreen(),
  };
}
