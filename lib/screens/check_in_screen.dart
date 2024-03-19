import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: setMainBgGradient(),
        child: const Center(
          child: Text(
            "Check-In screen",
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 55, 55, 55),
            ),
          ),
        ),
      ),
    );
  }
}
