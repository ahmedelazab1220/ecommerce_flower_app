import 'package:ecommerce_flower_app/features/notifications/domain/entity/notification_entity.dart';
import 'package:flutter/material.dart';

import '../../../features/about_us/presentation/view/about_us_screen.dart';
import '../../../features/address_details/presentation/view/screens/address_details_screen.dart';
import '../../../features/auth/presentation/view/screens/login/login_screen.dart';
import '../../../features/auth/presentation/view/screens/register/register_screen.dart';
import '../../../features/cart/presentation/view/screens/cart_screen.dart';
import '../../../features/categories/presentation/view/screens/categories_screen.dart';
import '../../../features/change_password/presentation/view/screens/change_password_screen.dart';
import '../../../features/checkout/presentation/view/screen/checkout_screen.dart';
import '../../../features/checkout/presentation/view/widgets/track_order_success_screen.dart';
import '../../../features/edit_profile/presentation/view/edit_profile_screen.dart';
import '../../../features/main_layout/presentation/view/main_layout.dart';
import '../../../features/notifications/presentation/view/screen/notification_details.dart';
import '../../../features/notifications/presentation/view/screen/notification_screen.dart';
import '../../../features/occasions/presentation/view/screen/occasion_screen.dart';
import '../../../features/orders/presentation/view/screens/orders_screen.dart';
import '../../../features/product_details/presentation/view/screens/product_details_screen.dart';
import '../../../features/most_selling_products/presentation/view/screens/best_sellers_screen.dart';
import '../../../features/saved_addresses/presentation/view/saved_address_screen.dart';
import '../../../features/terms_and_conditions/presentation/view/terms_and_conditions_screen.dart';
import '../shared_models/address_entity.dart';
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
  static const String savedAddressRoute = '/saved-address';
  static const String addressDetailsRoute = '/address-details';
  static const String checkoutRoute = '/checkout';
  static const String trackOrderSuccessRoute = '/track-order-success';
  static const String paymentWebViewRoute = '/payment-web-view';
  static const String cartScreenRoute = '/cart-screen';
  static const String ordersRoute = '/orders';
  static const String notificationScreenRoute = '/notification-screen';
  static const String notificationDetailsRoute = '/notification-details';

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
    checkoutRoute: (context) => const CheckoutScreen(),
    trackOrderSuccessRoute: (context) => const TrackOrderSuccessScreen(),
    termsAndConditionsRoute: (context) => const TermsAndConditionsScreen(),
    aboutUsRoute: (context) => const AboutUsScreen(),
    savedAddressRoute: (context) => const SavedAddressScreen(),
    cartScreenRoute: (context) => const CartScreen(),
    addressDetailsRoute: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final addressEntity = args?['addressEntity'] as AddressEntity?;
      return AddressDetailsScreen(address: addressEntity);
    },
    notificationScreenRoute: (context) => const NotificationScreen(),
    notificationDetailsRoute: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final notificationEntity =
          args?['notificationEntity'] as NotificationEntity?;
      return NotificationDetails(notificationEntity: notificationEntity!);
    },
    ordersRoute: (context) => const OrdersScreen(),
  };
}
