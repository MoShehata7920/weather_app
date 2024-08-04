import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/resources/routes_manager.dart';
import 'package:weather_app/utils/animation.dart';
import 'package:weather_app/utils/utils.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          SizedBox(
            height: size.height * 0.4,
            child: Lottie.asset("assets/json/splash.json").animateOnPageLoad(
                msDelay: 150, dx: 0.0, dy: -200.0, showDelay: 900),
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.35,
              ),
              const Text(
                "Developed By",
                style: TextStyle(
                  color: Color(0xFF00BCD4),
                  fontSize: 18,
                ),
              ).animateOnPageLoad(
                  msDelay: 300, dx: 0.0, dy: 70.0, showDelay: 300),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Mohamed Shehata",
                style: TextStyle(
                  color: Color(0xFF707099),
                  fontSize: 16,
                ),
              ).animateOnPageLoad(
                  msDelay: 300, dx: 0.0, dy: 70.0, showDelay: 300),
            ],
          ),
        ],
      ),
    );
  }

  void navigateToHome() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, Routes.homeRoute));
  }
}
