import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisewave/screens/user_profile_screen.dart';

AppBar myAppBar(String name, String userProfilePic, int currentPageIndex,
    BuildContext context) {
  String defaultProfilePic = "assets/images/default-profile-pic.png";

  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    titleSpacing: 20,
    elevation: 0,
    title: currentPageIndex == 0
        ? RichText(
            text: TextSpan(
              text: "Hi ",
              style: const TextStyle(
                color: Color(0xFF373737),
                fontSize: 30,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: name,
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
                  ),
    actions: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UserProfileScreen(userName: name);
          }));
        },
        child: CircleAvatar(
          radius: 23,
          backgroundColor: const Color(0xFF474747),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: userProfilePic != ""
                ? AssetImage(userProfilePic)
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
