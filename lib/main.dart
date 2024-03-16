import 'package:flutter/material.dart';
import 'package:wisewave/pages/auth_page.dart';
//import 'package:wisewave/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "WiseWave";
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(fontFamily: 'Epilogue'),
      home: const AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
