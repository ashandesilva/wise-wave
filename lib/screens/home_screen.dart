import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD:lib/home_screen.dart
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Builder(
          builder: (context) {
            return const Row(
              children: [
                Text(
                  "Hi ",
                  style: TextStyle(
                    fontFamily: 'Epilogue',
                    color: Color.fromARGB(255, 55, 55, 55),
                  ),
                ),
                Text(
                  "Sarina!",
                  style: TextStyle(
                    fontFamily: 'Epilogue',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 55, 55),
                  ),
                ),
              ],
            );
          },
        ),
=======
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
      ]
>>>>>>> 6b159ac0b508773e30e585e0b3afbb0362041d18:lib/screens/home_screen.dart
      ),
      body: Container(
        decoration: setBgGradient(),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good \nAfternoon,",
                    style: TextStyle(
                      fontFamily: 'Epilogue',
                      fontSize: 40,
                      color: Color.fromARGB(255, 55, 55, 55),
                    ),
                  ),
                  Text(
                    "Sarina!",
                    style: TextStyle(
                      fontFamily: 'Epilogue',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color.fromARGB(255, 55, 55, 55),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration setBgGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xffb8d7e5), Color(0xffbae8d7)],
        stops: [0, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}