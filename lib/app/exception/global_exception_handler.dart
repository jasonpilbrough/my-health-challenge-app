import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_health/common/exception/crash_reporting.dart';

@singleton
class GlobalExceptionHandler {
  final CrashReporting _crashReporting;

  GlobalExceptionHandler(this._crashReporting);

  void onError(Object error, StackTrace stack) {
    _crashReporting.reportFatal(error, stack);
    if (!kDebugMode) {
      exit(1);
    }
  }

  void onBuildPhaseError(FlutterErrorDetails details) {
    _crashReporting.reportFlutterFrameworkFatal(details);
  }
}
