import 'package:flutter/foundation.dart';

class Logger {
  static void f(Object message) {
    debugPrint('(Fatal): $message');
  }

  static void e(Object message) {
    debugPrint('(Error): $message');
  }

  static void i(Object message) {
    debugPrint('(Info): $message');
  }

  static void result(Object message) {
    debugPrint('(Result): $message');
  }

  static void log(Object message) {
    debugPrint('$message');
  }
}
