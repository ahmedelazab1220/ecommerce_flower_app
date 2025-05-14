import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/theme/app_theme.dart';
import 'package:ecommerce_flower_app/core/utils/app_strater.dart';
import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:ecommerce_flower_app/features/track_order/presentation/view/screen/track_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import 'core/functions/initial_route_function.dart';
import 'core/utils/bloc_observer/bloc_observer_service.dart';
import 'core/utils/di/di.dart';
import 'core/utils/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStrater.init();

  Bloc.observer = BlocObserverService(getIt<Logger>());
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale(Constants.ar), Locale(Constants.en)],
      path: Constants.assetsTranslations,
      startLocale: AppStrater.startLocale ?? const Locale(Constants.en),
      fallbackLocale: const Locale(Constants.en),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final routeInitializer = getIt<RouteInitializer>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 910),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce Flower App',
          routes: AppRoutes.routes,
          theme: AppTheme.appTheme,
          // initialRoute: routeInitializer.computeInitialRoute(),
          home: TrackOrderScreen(orderId: "123456789"),
        );
      },
    );
  }
}
