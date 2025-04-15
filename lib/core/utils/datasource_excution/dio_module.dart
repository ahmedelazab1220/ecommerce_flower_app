import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../di/di.dart';
import 'api_constants.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      baseUrl: ApiConstants.baseUrl,
    );
    dio.interceptors.add(providerInterceptor());
    dio.interceptors.add(AppInterceptors());
    return dio;
  }

  @lazySingleton
  PrettyDioLogger providerInterceptor() {
    return PrettyDioLogger(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );
  }
}

@lazySingleton
class AppInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await getIt<FlutterSecureStorage>().read(key: "token");

    print("token: $token");
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
      options.headers["token"] = token;
    }
    super.onRequest(options, handler);
  }
}
