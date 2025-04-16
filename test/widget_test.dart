import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:ecommerce_flower_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [];
    EasyLocalization.logger.enableBuildModes = [];
  });

  Future<void> pumpLocalizedWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale(Constants.ar), Locale(Constants.en)],
        path: Constants.assetsTranslations,
        fallbackLocale: const Locale(Constants.en),
        startLocale: const Locale(Constants.en),
        child: MyApp(),
      ),
    );
  }

  testWidgets('Finds main widgets and localization', (
    WidgetTester tester,
  ) async {
    await pumpLocalizedWidget(tester);
  });
}
