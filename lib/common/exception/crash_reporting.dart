import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_health/common/exception/app_logger.dart';
import 'package:my_health/common/extension/string_extension.dart';

@singleton
class CrashReporting {
  void reportFatal(Object error, StackTrace stackTrace) {
    Logger.i('Reporting fatal error...');

    // Could report fatal error to remote server here

    Logger.f(error);
    Logger.log(_prepareStackTrace(stackTrace));
  }

  void reportFlutterFrameworkFatal(FlutterErrorDetails details) {
    Logger.i('Reporting fatal error...');

    // Could report fatal error to remote server here
  }

  void reportNonFatal(dynamic exception, {StackTrace? stackTrace}) {
    Logger.i('Reporting non-fatal error...');

    // Could report non-fatal error to remote server here

    Logger.e(exception);
    Logger.log(_prepareStackTrace(stackTrace));
  }

  StackTrace _prepareStackTrace(StackTrace? stackTrace) {
    if (stackTrace != null) {
      return stackTrace;
    }
    String currentStackTrace = StackTrace.current.toString();
    String trimmedStackTrace = currentStackTrace.removeFirstNLines(2);
    return StackTrace.fromString(trimmedStackTrace);
  }
}
