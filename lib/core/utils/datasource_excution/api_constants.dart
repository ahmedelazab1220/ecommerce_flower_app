class ApiConstants {
  // Private constructor to prevent instantiation
  ApiConstants._();

  static const String baseUrl = "https://flower.elevateegy.com/api/v1/";
  //////////////////////////// Auth Routes ////////////////////////////
  static const String signupRoute = "auth/signup";
  static const String loginRoute = "auth/signin";
  static const String changePasswordRoute = "auth/change-password";
  static const String uploadProfilePhotoRoute = "auth/upload-photo";
  static const String profileDataRoute = "auth/profile-data";
  static const String logoutRoute = "auth/logout";
  static const String forgetPasswordRoute = "auth/forgotPassword";
  static const String verifyRestCodeRoute = "auth/verifyResetCode";
  static const String resetPasswordRoute = "auth/resetPassword";
  static const String deleteAccountRoute = "auth/deleteMe";
  static const String editProfileRoute = "auth/editProfile";
  //////////////////////////// Home Routes ////////////////////////////
  static const String homeTabRoute = "home";
  static const String categoriesRoute = "categories";
  static const String occasionsRoute = "occasions";
  static const String allProductsRoute = "products";
  static const String bestSellerRoute = "best-seller";
  static const String cartRoute = "cart";
  //////////////////////////// Orders Routes ////////////////////////////
  static const String addCacheOrderRoute = "orders";
  static const String addCreditOrderRoute = "orders/checkout";
  //////////////////////////// Addresses Routes ////////////////////////////
  static const String addressesRoute = "addresses";
}
