import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';

class SayThanksPage extends StatelessWidget {
  //passed uid from nav_page.dart
  final String uid;
  final _gratitudeController = TextEditingController();
  SayThanksPage({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                decoration: setMainBgGradient(),
              ),
              SafeArea(
                child: Column(
                  children: [
                    AppBar(
                      title: const Text('Say Thanks'),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Today Is:",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            DateTime.now().toString().split(' ')[0],
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 46, 50, 51)),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Its a Wonderful Day! 🌞",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(height: 100),
                          const Text(
                            "What Are You Thankful About? 🌈",
                            style: TextStyle(fontSize: 23),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                              controller: _gratitudeController,
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFE3F4F7),
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 60.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFE3F4F7)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFE3F4F7)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Today I am grateful for...',
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(122, 71, 71, 71),
                                ),
                                //contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 60, 187, 209)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('gratitude')
                                  .add({
                                'userId': uid,
                                'date': DateTime.now(),
                                'gratitude': _gratitudeController.text,
                              }).then((_) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Always remember to be thankful ❤️')),
                                );
                              });
                            },
                            child: const Text(
                              'Say Thanks!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            '"Gratitude turns what we have into enough. 🌟"',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 46, 50, 51),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
