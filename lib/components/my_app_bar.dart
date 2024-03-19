import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar myAppBar(String name, String userProfilePic) {
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
    title: RichText(
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
    ),
    actions: <Widget>[
      CircleAvatar(
        radius: 25,
        backgroundColor: const Color(0xFF474747),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: userProfilePic != ""
              ? AssetImage(userProfilePic)
              : AssetImage(defaultProfilePic),
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
