import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wisewave/pages/login_or_singup_page.dart';
import 'package:wisewave/pages/nav_page.dart';

//import 'package:wise_wave/screens/login_screen.dart';
//import 'package:wise_wave/screens/login_screen.dart';
// ignore: must_be_immutable
class AuthPage extends StatelessWidget {
  // const AuthPage({super.key});

  final User? user = FirebaseAuth.instance.currentUser;
  String? uid;

  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //pass current user id to the nav page
            return NavPage(
              uid: snapshot.data!.uid,
              index: 0,
            );
          } else {
            //return const SignupPage();
            return const LoginOrSignupPage();
          }
        },
      ),
    );
  }
}
