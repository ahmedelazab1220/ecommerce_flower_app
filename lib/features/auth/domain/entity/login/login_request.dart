class LoginRequest {
  final String email;
  final String password;
  final bool isRememberMe;

  LoginRequest({
    required this.email,
    required this.password,
    required this.isRememberMe,
  });
}
