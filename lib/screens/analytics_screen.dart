import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: setMainBgGradient(),
        child: const Center(
          child: Text("Analytics"),
        ),
      ),
    );
  }
}
