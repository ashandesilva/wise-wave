import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';

// ignore: must_be_immutable
class UserProfileScreen extends StatelessWidget {
  String userName;
  final String _userProfilePic = "assets/images/profile-pic-sample.png";

  String get userProfilePic => _userProfilePic;

  UserProfileScreen({super.key, required this.userName});

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: setMainBgGradient(),
        padding: const EdgeInsets.only(top: 130.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              circleAvatar(),
              const SizedBox(height: 20.0),
              // name text
              Center(
                child: Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF474747),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              accountDetailsListTile(),
              const SizedBox(height: 25),
              settingsListTile(),
              const SizedBox(height: 25),
              logoutListTile()
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector circleAvatar() {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 89,
            backgroundColor: const Color(0xFF474747),
            child: CircleAvatar(
              radius: 80.0,
              backgroundImage: _userProfilePic != ""
                  ? AssetImage(userProfilePic)
                  : const AssetImage(
                      "assets/images/default-profile-pic.png",
                    ), // replace image
            ),
          ),
          const Opacity(
            opacity: 0.5,
            child: Iconify(
              Bx.bxs_camera, // change icon
              color: Colors.grey,
              size: 80.0,
            ),
          ),
        ],
      ),
    );
  }

  Material accountDetailsListTile() {
    return Material(
      elevation: 10,
      shadowColor: const Color.fromARGB(90, 0, 0, 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: ListTile(
        title: const Text(
          "Account details",
          style: TextStyle(
            fontSize: 23,
            color: Color(0xFF373737),
          ),
        ),
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        tileColor: const Color(0xFFE3F4F7),
        splashColor: const Color(0xFFFFFFFF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Iconify(
            Bx.user_circle,
            color: Color(0xFF373737),
            size: 40,
          ),
        ),
      ),
    );
  }

  Material settingsListTile() {
    return Material(
      elevation: 10,
      shadowColor: const Color.fromARGB(90, 0, 0, 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: ListTile(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 23,
            color: Color(0xFF373737),
          ),
        ),
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        tileColor: const Color(0xFFE3F4F7),
        splashColor: const Color(0xFFFFFFFF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Iconify(
            Bx.certification,
            color: Color(0xFF373737),
            size: 40,
          ),
        ),
      ),
    );
  }

  Material logoutListTile() {
    return Material(
      elevation: 10,
      shadowColor: const Color.fromARGB(90, 0, 0, 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: ListTile(
        title: const Text(
          "Log out",
          style: TextStyle(
            fontSize: 23,
            color: Color(0xFF373737),
          ),
        ),
        onTap: () {
          signUserOut();
        },
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        tileColor: const Color(0xFFE3F4F7),
        splashColor: const Color(0xFFFFFFFF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Iconify(
            Bx.log_out_circle,
            color: Color(0xFF373737),
            size: 40,
          ),
        ),
      ),
    );
  }
}
