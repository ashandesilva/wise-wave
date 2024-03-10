import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: setBgGradient(),
        child: Center(
          child: Image.asset(
            "assets/final-logo-of-wise-wave.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  BoxDecoration setBgGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xfff2c3b2), Color(0xffe5a8b6)],
        stops: [0, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
