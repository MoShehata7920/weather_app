import 'package:flutter/material.dart';
import 'package:weather_app/pages/splash/splash_screen.dart';
import 'package:weather_app/pages/weather_page/weather_page.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => const WeatherPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Title"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
