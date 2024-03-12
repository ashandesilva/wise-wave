import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: setMainBgGradient(),
        child: const Center(
          child: Text(
            "User Profile screen",
            style: TextStyle(
              fontSize: 33,
              fontFamily: 'Epilogue',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 55, 55, 55),
            ),
          ),
        ),
      ),
    );
  }
}
