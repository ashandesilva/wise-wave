import 'package:flutter/material.dart';
import 'package:wisewave/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "WiseWave";
    return const MaterialApp(
      title: appTitle,
      home: LoginScreen(),
    );
  }
}
