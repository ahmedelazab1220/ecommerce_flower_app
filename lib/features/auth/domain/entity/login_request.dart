class LoginRequest {
  String email;
  String password;
  bool isRememberMe;
  LoginRequest({
    required this.email,
    required this.password,
    required this.isRememberMe,
  });
}
