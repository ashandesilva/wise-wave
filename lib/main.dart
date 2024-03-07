import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "WiseWave";
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: const WelcomePage(title: appTitle),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: setBgGradient(),
        child: Center(
          child: Image.asset(
            "images/final-logo-of-wise-wave.png",
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
        stops: [0.25, 0.75],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
