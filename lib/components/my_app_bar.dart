import 'package:flutter/material.dart';

AppBar myAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleSpacing: 25,
    title: Builder(
      builder: (context) {
        return const Column(
          children: [
            SizedBox(height: 9),
            Row(
              children: [
                Text(
                  "Hi ",
                  style: TextStyle(
                    fontFamily: 'Epilogue',
                    color: Color.fromARGB(255, 55, 55, 55),
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Naaji!",
                  style: TextStyle(
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
