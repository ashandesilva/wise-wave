import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:wisewave/components/theme/nav_bg_gradient.dart';
import 'package:wisewave/pages/login_or_singup_page.dart';
import 'package:wisewave/screens/settings_screen.dart';
import 'package:image_picker/image_picker.dart'; 

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  File _image = File('assets/images/profile-pic-sample.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 24.0,
          ),
        ),
        flexibleSpace: Container(
          decoration: setNavBgGradient(),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Container(
        decoration: setMainBgGradient(),
        padding: EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final picker = ImagePicker();
                    final pickedFile = await picker.getImage(source: ImageSource.gallery);

                    if (pickedFile != null) {
                      setState(() {
                        _image = File(pickedFile.path);
                      });
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage('assets/images/profile-pic-sample.png') as ImageProvider<Object>?,
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Icon(
                          Icons.camera,
                          color: Colors.grey,
                          size: 60.0,
                        ),
                      ),
                    ],
                  ),
),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    'Sarina',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle),
                      SizedBox(width: 10.0),
                      Text('Account details', style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingsScreen()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.settings),
                            SizedBox(width: 10.0),
                            Text('Settings', 
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(Icons.logout),
      SizedBox(width: 10.0),
      GestureDetector(
        onTap: () {
          showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Log out'),
              content: Text('Are you sure you want to log out?'),
              actions: <Widget>[
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginOrSignupPage()),
                    );
                  },
                ),
              ],
            );
          },
);
        },
        child: Text('Log out', style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold)),
      ),
    ],
  ),
),
              ],
            ),
            const Spacer(),
            Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'App Version 1.0.0, \n© 2024 WiseWave. All rights reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                    color: Colors.grey[600],
                ),
              ),
            ),
          ),
          ],
        ), 
      ),
    );
  }
}


