import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_health/app/app.dart';
import 'package:my_health/app/configuration/config_loader.dart';
import 'package:my_health/app/di/app_module.dart';
import 'package:my_health/app/exception/global_exception_handler.dart';
import 'package:my_health/common/exception/app_logger.dart';

void main() async {
  runZonedGuarded(() async {
    Logger.i('Launching application...');
    WidgetsFlutterBinding.ensureInitialized();

    final configuration = await ConfigLoader.load();
    registerDependencies(configuration);

    FlutterError.onError = (FlutterErrorDetails details) {
      locator<GlobalExceptionHandler>().onBuildPhaseError(details);
    };

    runApp(const App());
  }, (Object error, StackTrace stack) {
    _handleGlobalException(error, stack);
  });
}

void _handleGlobalException(Object error, StackTrace stack) {
  bool canHandleException = locator.isRegistered<GlobalExceptionHandler>();
  if (canHandleException) {
    locator<GlobalExceptionHandler>().onError(error, stack);
  } else {
    Logger.f("Exception handler not initialized. Can't report error.");
    Logger.f(error.toString());
    Logger.log(stack.toString());
  }
}
