import 'package:flutter/material.dart';
import 'package:wisewave/pages/login_or_singup_page.dart';

import '../components/theme/main_bg_gradient.dart';
import '../components/theme/nav_bg_gradient.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {

  bool _notificationsOn = false;

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Settings',
            style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 24.0,
          ),
          ),
          flexibleSpace: Container(
          decoration: setNavBgGradient(),
          
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: setMainBgGradient(),
        //color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: ListView(
            children: [
              ListTile( // username change
                leading: Icon(Icons.person),
                title: Text('Change Username'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Change Username', textAlign: TextAlign.center),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'New Username',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              width: 200.0,
                              child: TextButton(
                                child: Text('Change'),
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFE5A8B6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  // TODO: Implement username change logic
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              Divider(),
              ListTile( // password change
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Change Password', textAlign: TextAlign.center),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Current Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'New Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Confirm New Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              width: 200.0, // Specify the width here
                              child: TextButton(
                                child: Text('Change'),
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFE5A8B6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  // TODO: Implement password change logic
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              Divider(),
              ListTile( // change theme
                leading: Icon(Icons.color_lens),
                title: Text('Change Theme'),
                onTap: () {
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      //title: Text('Choose an Option', textAlign: TextAlign.center),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          ElevatedButton(
                              onPressed: () {
                                //Provider.of<ThemeProvider>(context).togleTheme(3); //nature
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                shape: MaterialStateProperty.all(CircleBorder()),
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                colors: [Color.fromARGB(255, 184, 215, 229),Color.fromARGB(255, 242, 195, 178)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              ),
                            ),
                          ElevatedButton(
                              onPressed: () {
                                //Provider.of<ThemeProvider>(context).togleTheme(3); //nature
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                shape: MaterialStateProperty.all(CircleBorder()),
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.grey, Color.fromARGB(255, 48, 48, 48)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              ),
                            ),
                        ],
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                //Provider.of<ThemeProvider>(context).togleTheme(3); //nature
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                shape: MaterialStateProperty.all(CircleBorder()),
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                  colors: [Color.fromRGBO(236, 206, 130, 1), Color.fromARGB(255, 154, 114, 99)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                //Provider.of<ThemeProvider>(context).togleTheme(3); //nature
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                shape: MaterialStateProperty.all(CircleBorder()),
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [const Color.fromRGBO(165, 214, 167, 1), Color.fromARGB(255, 96, 234, 167)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
                }
              ),
              Divider(),
              ListTile( //Notifications
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Text('Notifications', textAlign: TextAlign.center),
                          content: SwitchListTile(
                            title: Text('Show Notifications'),
                            value: _notificationsOn,
                            onChanged: (bool value) {
                              setState(() {
                                _notificationsOn = value;
                              });
                            },
                          ),
                          //actions: <Widget>[
                          //  TextButton(
                          //    child: Text('Close'),
                          //    onPressed: () {
                          //      Navigator.of(context).pop();
                          //    },
                          //  ),
                          //],
                        );
                      },
                    );
                  },
                );
              },
              ),
              Divider(),
              ListTile( // clear chats
                leading: Icon(Icons.clear_all),
                title: Text('Clear Chats'),
              ),
              Divider(),
              ListTile( // delete account
  leading: Icon(Icons.delete),
  title: Text('Delete Account'),
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete the account?'),
          actions: <Widget>[
            TextButton(
              child: Text('No', style: TextStyle(color: Colors.black)),
              
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation', textAlign: TextAlign.center),
                      content: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Delete', style: TextStyle(color: Colors.black)),
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
            ),
          ],
        );
      },
    );
  },
),
            ],
          ),
        ),
      ),
    );
  }
}

