import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  Future<void> refreshHandler() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: refreshHandler,
        color: const Color.fromARGB(255, 184, 215, 229),
        height: 150,
        backgroundColor: const Color.fromARGB(255, 130, 196, 226),
        animSpeedFactor: 3,
        showChildOpacityTransition: false,
        child: Container(
          decoration: setMainBgGradient(),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(height: 100,
                color: const Color.fromARGB(255, 200, 114, 207),),
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 100,
                    color: const Color.fromARGB(255, 200, 114, 207),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 100,
                    color: const Color.fromARGB(255, 200, 114, 207),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
