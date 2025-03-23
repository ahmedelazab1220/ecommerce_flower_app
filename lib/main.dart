import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

import 'core/utils/bloc_observer/bloc_observer_service.dart';
import 'core/utils/di/di.dart';
import 'core/utils/routes/routes.dart';
import 'features/auth/presentation/view/login_screen.dart';

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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 910),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoutes.routes,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
