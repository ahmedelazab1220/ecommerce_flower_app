import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../l10n/locale_keys.g.dart';

@lazySingleton
class Validator {
  String? validateEmail(String input) {
    if (input.isEmpty) {
      return LocaleKeys.EmailCannotBeEmpty.tr();
    } else if (!RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
      r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$",
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
      return LocaleKeys.PasswordRequirements.tr();
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
    phoneNumber = phoneNumber.trim().replaceAll(RegExp(r'\s+'), '');

    if (phoneNumber.isEmpty) {
      return LocaleKeys.PhoneNumberCannotBeEmpty.tr();
    }

    final egyptianInternationalRegex = RegExp(r'^\+201[0125][0-9]{8}$');

    if (egyptianInternationalRegex.hasMatch(phoneNumber)) {
      return null;
    }
    return LocaleKeys.InvalidPhoneNumber.tr();
  }
}
