import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../core/util/responsive.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSplashScreen(
          backgroundColor: Color(0xff25AE4B),
          splash: Image.asset("assets/images/logo.png"),
          animationDuration: const Duration(seconds: 3),
          nextScreen: const OnboardingScreen(),
          splashTransition: SplashTransition.scaleTransition,
          curve: Curves.easeOutQuad,
        ),
        Image.asset(
          "assets/images/pattern.png",
          height: responsiveHeight(context, 932),
          width: responsiveWidth(context, 430),
        ),
      ],
    );
  }
}
