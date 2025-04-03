sealed class RegisterIntent {}

class RegisterButtonPressedIntent extends RegisterIntent {}

class GenderChangedIntent extends RegisterIntent {
  final String gender;
  GenderChangedIntent({required this.gender});
}

class NavigateToLoginIntent extends RegisterIntent {}

class UserRegistrationIntent extends RegisterIntent {}
