import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class BlocObserverService extends BlocObserver {
  final Logger logger;

  BlocObserverService(this.logger);

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e(
      'onError -- ${bloc.runtimeType}, $error',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.w('onClose -- ${bloc.runtimeType}');
  }
}
