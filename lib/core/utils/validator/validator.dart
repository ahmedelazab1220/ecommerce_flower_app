import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../l10n/locale_keys.g.dart';

@lazySingleton
class Validator {
  String? validateEmail(String input) {
    if (input.isEmpty) {
      return LocaleKeys.EmailCannotBeEmpty.tr();
    } else if (!RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(input)) {
      return LocaleKeys.EnterAValidEmail.tr();
    }
    return null;
  }

  String? validatePassword(String input) {
    if (input.isEmpty) {
      return LocaleKeys.PasswordCannotBeEmpty.tr();
    } else if (!RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    ).hasMatch(input)) {
      return LocaleKeys.InvalidPassword.tr();
    }
    return null;
  }

  String? validateConfirmPassword(String input, String password) {
    if (input.isEmpty || input != password) {
      return LocaleKeys.ConfirmPasswordMustMatch.tr();
    }
    return null;
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return LocaleKeys.NameCannotBeEmpty.tr();
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return LocaleKeys.InvalidName.tr();
    } else {
      return null;
    }
  }

  String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return LocaleKeys.PhoneNumberCannotBeEmpty.tr();
    } else if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(phoneNumber)) {
      return LocaleKeys.InvalidPhoneNumber.tr();
    }
    return null;
  }
}
