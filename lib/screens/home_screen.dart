import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:iconify_flutter/icons/bxs.dart';
import 'package:wisewave/pages/add_check_ins_page.dart';
import 'package:wisewave/pages/daily_challange.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 150.0),
        decoration: setMainBgGradient(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _getCheckInsCard(context),
                _getQuoteCard(),
                _getDailyChallangeCard(context),
              ],
            ),
          ),
        ),
      ),
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
                      fontFamily: 'Epilogue',
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

  Padding _getQuoteCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
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
                  SizedBox(
                    width: 250,
                    child: Text(
                      '“It is better to conquer yourself than to win a thousand battles”',
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
                        fontFamily: 'Epilogue',
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 55, 55, 55)),
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
