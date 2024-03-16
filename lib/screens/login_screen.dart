import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wisewave/animation/fade_animation.dart';
import 'package:wisewave/components/my_button.dart';
import 'package:wisewave/components/my_textfield.dart';
import 'package:wisewave/components/square_tile.dart';
import 'package:wisewave/components/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editior controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FadeAnimation(1.5, Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xfff2c2b1),
                Color(0xffe5a8b6)
              ]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/final-logo-of-wise-wave.png',
                  fit: BoxFit.cover,
                  width: 155,
                  height: 151,
                  ),

                  const SizedBox(height: 50),

                  //Email
                   MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false                    
                  ),

                  const SizedBox(height: 20),

                  //Password
                   MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,                    
                  ),

                  const SizedBox(height: 30),

                  //login button
                  MyButton(
                    onTap: signUserIn,
                  ),

                  const SizedBox(height: 30),

                  //or
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: const Divider(
                            thickness: 2,
                            color: Color(0xff000000),
                            height: 36,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            height: 0.5,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: const Divider(
                            thickness: 2,
                            color: Color(0xff000000),
                            height: 36,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20,),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //google
                      SquareTile(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'assets/images/google.jpeg'),
                      // //apple
                      // SquareTile(imagePath: 'assets/images/apple.jpeg'),
                    ],
                  ),
                  const SizedBox(height: 50,),

                  //signup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 15,
                          height: 0.5,
                          color: Color(0xff000000),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        // onTap: () {
                        //   Navigator.pushNamed(context, '/signup');
                        // },
                        onTap: widget.onTap,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            height: 0.5,
                            color: Color.fromARGB(255, 107, 167, 245),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ), 
            ),
          ),
        ),
        ),
      ),
    );
  }
}