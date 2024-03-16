import 'package:flutter/material.dart';

AppBar myAppBar(String name) {
  return AppBar(
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    elevation: 0,
    titleSpacing: 25,
    title: Builder(
      builder: (context) {
        return Column(
          children: [
            const SizedBox(height: 9),
            Row(
              children: [
                const Text(
                  "Hi ",
                  style: TextStyle(
                    fontFamily: 'Epilogue',
                    color: Color.fromARGB(255, 55, 55, 55),
                    fontSize: 30,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Epilogue',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 55, 55),
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ),
    actions: const <Widget>[
      CircleAvatar(
        radius: 50,
        backgroundColor: Color.fromARGB(255, 71, 71, 71),
        child: CircleAvatar(
          radius: 23,
          backgroundImage: AssetImage("assets/images/profile-pic-sample.png"),
        ),
      ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}
