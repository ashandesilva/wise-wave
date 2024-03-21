import 'package:flutter/material.dart';
import 'package:wisewave/pages/login_or_singup_page.dart';

import '../components/theme/main_bg_gradient.dart';
import '../components/theme/nav_bg_gradient.dart';

class SettingsScreen extends StatelessWidget {

  bool _notificationsOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 24.0,
          ),
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
                flexibleSpace: Container(
          decoration: setNavBgGradient(),
        ),
      ),
      body: Container(
        decoration: setMainBgGradient(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Username Change'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
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
                                child: Text('Change', style: TextStyle(color: Colors.red[100])),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.pink[900],
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

              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Password Change'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Password Change', textAlign: TextAlign.center),
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
                                child: Text('Change', style: TextStyle(color: Colors.red[100])),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.pink[900],
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
              ListTile(
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
              ListTile(
                leading: Icon(Icons.clear_all),
                title: Text('Clear Chats'),
              ),
              Divider(),
              ListTile(
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
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
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
                          child: Text('Delete'),
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
