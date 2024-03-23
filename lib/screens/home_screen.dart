import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:iconify_flutter/icons/bxs.dart';
import 'package:wisewave/pages/add_check_ins_page.dart';
import 'package:wisewave/pages/daily_challange.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  
  //retrive uid from auth service page
  final String uid;
  const HomeScreen({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    //add stream builder to get user data from firestore
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final username = snapshot.data!.get('name');
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 130.0),
              decoration: setMainBgGradient(),
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _getCheckInsCard(context),
                        _getQuoteCard(username),
                        _getDailyChallangeCard(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  GestureDetector _getCheckInsCard(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const AddCheckInPage();
        }));
      },
      child: Card(
        shadowColor: const Color.fromARGB(67, 0, 0, 0),
        elevation: 10,
        color: const Color(0xFFE3F4F7),
        surfaceTintColor: const Color(0xFFE3F4F7),
        shape: _roundCardCorners(),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daily Check-Ins",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 55, 55, 55),
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text("How are you Feeling today?"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          "Add Check-In",
                          style: TextStyle(
                            color: Color(0xFFE58C8F),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Iconify(
                          Bxs.right_arrow_alt,
                          color: Color(0xFFE58C8F),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Image(
                  image: AssetImage("assets/images/happy-face-icon.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Padding _getQuoteCard(String username) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Card(
        shadowColor: const Color.fromARGB(67, 0, 0, 0),
        elevation: 10,
        color: const Color(0xFFE3F4F7),
        surfaceTintColor: const Color(0xFFE3F4F7),
        shape: _roundCardCorners(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Welcome, $username! It is better to conquer yourself than to win a thousand battles',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Image(
                  image: AssetImage("assets/images/fa_quote-left.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _getDailyChallangeCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: GestureDetector(
        onTap: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DailyChallange();
          }));
        },
        child: Card(
          shadowColor: const Color.fromARGB(67, 0, 0, 0),
          elevation: 10,
          color: const Color(0xFFE3F4F7),
          surfaceTintColor: const Color(0xFFE3F4F7),
          shape: _roundCardCorners(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Daily Challenge",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 55, 55, 55),
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: RichText(
                        text: const TextSpan(
                          text: "Ends in ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 55, 55, 55),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "09:38:44",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Text(
                            "View Challange",
                            style: TextStyle(
                              color: Color(0xFFE58C8F),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Iconify(
                            Bxs.right_arrow_alt,
                            color: Color(0xFFE58C8F),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Image(
                    width: 80,
                    image: AssetImage("assets/images/fa-flag-2.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RoundedRectangleBorder _roundCardCorners() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    );
  }
}
