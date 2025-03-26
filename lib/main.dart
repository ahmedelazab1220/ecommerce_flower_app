import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/theme/app_theme.dart';
import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

import 'core/utils/bloc_observer/bloc_observer_service.dart';
import 'core/utils/di/di.dart';
import 'core/utils/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await configureDependencies();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = BlocObserverService(getIt<Logger>());
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale(Constants.ar), Locale(Constants.en)],
      path: Constants.assetsTranslations,
      fallbackLocale: const Locale(Constants.en),
      startLocale: const Locale(Constants.en),
      child: const ScreenUtilInit(
        designSize: Size(360, 910),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.register,
      theme: AppTheme.appTheme,
    );
  }
}
  