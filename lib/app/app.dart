import 'package:flutter/material.dart';
import 'package:my_health/app/navigation/route_provider.dart';
import 'package:my_health/app/resources/theme/theme_dark.dart';
import 'package:my_health/app/resources/theme/theme_light.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RouteProvider.provideInitialRoute(),
      initialRoute: RouteProvider.initialRoute,
      theme: LightTheme.defaultTheme,
      darkTheme: DarkTheme.defaultTheme,
    );
  }
}
