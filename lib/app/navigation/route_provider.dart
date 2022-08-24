import 'package:flutter/material.dart';
import 'package:my_health/app/journey/capture/page/capture_screen.dart';

class RouteProvider {
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> provideInitialRoute() {
    return {
      RouteProvider.initialRoute: (context) => const CaptureScreen(),
    };
  }
}
