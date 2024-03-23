import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:wisewave/screens/userprofile.dart';

// ignore: must_be_immutable
class UserProfileScreen extends StatefulWidget {
  String userName = "";
  String userProfilePic = "";

  UserProfileScreen({
    super.key,
    required this.userName,
    required this.userProfilePic,
  });

  @override
  // ignore: library_private_types_in_public_api
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final String _userProfilePic = "assets/images/profile-pic-sample.png";
  String get userProfilePic => _userProfilePic;

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      body: Container(
        decoration: setMainBgGradient(),
        padding: const EdgeInsets.only(top: 30.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              circleAvatar(),
              const SizedBox(height: 20.0),
              // name text
              Center(
                child: Text(
                  widget.userName,
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
              logoutListTile(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _myAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      title: const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF373737),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 242, 195, 178),
              Color.fromARGB(255, 229, 168, 182)
            ],
            stops: [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Image(
            width: 45,
            image: AssetImage("assets/images/close-button.png"),
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

  GestureDetector circleAvatar() {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 89,
        backgroundColor: const Color(0xFF474747),
        child: _userProfilePic != ""
            ? CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                  widget.userProfilePic,
                ),
              )
            : const CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage(
                  "assets/images/default-profile-pic.png",
                ),
              ),
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserProfile()),
          );
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

  Material logoutListTile(BuildContext context) {
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
        onTap: () async {
          signUserOut();
          Navigator.pop(context);
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
