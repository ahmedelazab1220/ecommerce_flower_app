import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_flower_app/features/profile/presentation/view_model/translation_state.dart';

import '../../../../core/utils/app_strater.dart';

class TranslationCubit extends Cubit<TranslationState> {
  static const String _languageCodeKey = 'selected_language_code';
  static String currentLanguage = 'en';

  TranslationCubit() : super(const TranslationState());

  Future<String> loadSavedLanguage(context) async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString(_languageCodeKey);
    if (langCode != null) {
      final locale = Locale(langCode);
      await context.setLocale(locale);
      emit(state.copyWith(currentLocale: locale));
      currentLanguage = langCode;
      return langCode;
    }
    return 'en';
  }

  Future<void> changeLanguage(BuildContext context, Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, locale.languageCode);
    await AppStrater.saveLocale(locale.languageCode);
    await context.setLocale(locale);
    emit(state.copyWith(currentLocale: locale));
  }
}
