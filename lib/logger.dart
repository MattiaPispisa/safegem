import 'package:en_logger/en_logger.dart';
import 'package:injectable/injectable.dart';

/// logger module
@module
abstract class LoggerModule {
  /// logger for production
  @LazySingleton(env: ['production'])
  EnLogger loggerProd() {
    return EnLogger();
  }

  /// logger for develop
  @LazySingleton(env: ['develop'])
  EnLogger loggerDev() {
    return EnLogger(
      defaultPrefixFormat: const PrefixFormat(
        startFormat: '[',
        endFormat: ']',
      ),
    )..addHandler(
        PrinterHandler(),
      );
  }
}
