import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wisewave/components/login_or_singup_page.dart';
import 'package:wisewave/screens/home_screen.dart';
//import 'package:wise_wave/screens/login_screen.dart';
//import 'package:wise_wave/screens/login_screen.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return const HomePage();
          } else {
            //return const SignupPage();
            return const LoginOrSignupPage();
          }
        } ,
      ),
    );
  }
}