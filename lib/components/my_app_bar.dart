// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisewave/screens/user_profile_screen.dart';

AppBar myAppBar(String name, int currentPageIndex, BuildContext context) {
  //retrive uid from auth service page
  final user = FirebaseAuth.instance.currentUser;
  String? uid = user?.uid;

  String defaultProfilePic = "assets/images/default-profile-pic.png";
  const String userProfilePic = "assets/images/profile-pic-sample.png";

  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    titleSpacing: 20,
    elevation: 0,
    title: StreamBuilder<DocumentSnapshot>(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (!snapshot.hasData || snapshot.data!.data() == null) {
          // Handle case where data is not available
          return const Text("No Data");
        }

        return currentPageIndex == 0
            ? RichText(
                text: TextSpan(
                  text: "Hi ",
                  style: const TextStyle(
                    color: Color(0xFF373737),
                    fontSize: 30,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "${snapshot.data!['name'].toString().split(" ")[0]}!",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : currentPageIndex == 1
                ? Text(
                    "Check-Ins",
                    style: _altTitleStyle(),
                  )
                : currentPageIndex == 2
                    ? Text(
                        "AI Assistant",
                        style: _altTitleStyle(),
                      )
                    : Text(
                        "Analytics",
                        style: _altTitleStyle(),
                      );
      },
    ),
    actions: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const UserProfileScreen();
            //create new user profile to check firestore dynamic data, remove the old one
            // return UserProfile();
          }));
        },
        child: CircleAvatar(
          radius: 23,
          backgroundColor: const Color(0xFF474747),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: userProfilePic != ""
                ? const AssetImage(userProfilePic)
                : AssetImage(defaultProfilePic),
          ),
        ),
      ),
      const SizedBox(width: 20),
    ],
    bottom: const PreferredSize(
      preferredSize: Size(0, 10),
      child: SizedBox(height: 0),
    ),
  );
}

TextStyle _altTitleStyle() {
  return const TextStyle(
    color: Color(0xFF373737),
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
}
