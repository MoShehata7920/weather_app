import 'package:flutter/material.dart';
import 'package:weather_app/pages/splash/splash_screen.dart';
import 'package:weather_app/resources/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      home: SplashScreen(),
    );
  }
}
