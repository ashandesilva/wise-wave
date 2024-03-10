import 'package:flutter/material.dart';
import 'package:wisewave/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Login screen.",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 15,
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
              child: const Text("Log In"),
            ),
          ],
        ),
      ),
    );
  }
}
