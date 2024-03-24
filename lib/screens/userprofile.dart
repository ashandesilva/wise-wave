import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/theme/nav_bg_gradient.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
  
}

class _UserProfileState extends State<UserProfile> {
  String _displayName = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    setState(() {
      _displayName = userData['name'];
      _email = userData['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('User Profile',
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Username',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                _displayName,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                _email,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle activity history button press
              },
              child: Text('Activity History'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle feedback/support button press
              },
              child: Text('Feedback/Support'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle get analysis button press
              },
              child: Text('Get Analysis'),
            ),
            SizedBox(height: 16.0),
            Divider(), // Add a divider below the Get Analysis button
            SizedBox(height: 16.0),
            // Add a donut chart with dummy data
            Container(
              height: 200,
              width:200,
              child: Stack(
                children: [
                  //CustomPaint(
                  //  painter: DonutChartPainter(),
                  //  child: Container(
                  //    height: 200,
                  //    width:200,
                  //  ),
                  //),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Dummy data
    final data = {
      'happy': 5,
      'sad': 3,
      'angry': 2,
      'anxious': 4,
      'stressed': 1,
      'excited': 6,
      'relaxed': 7,
      'energetic': 3,
      'lonely': 2,
      'calm': 5,
      'hopeful': 4,
      'bored': 2,
    };

    final total = data.values.reduce((a, b) => a + b);

    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.cyan,
      Colors.amber,
      Colors.lime,
    ];

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    double startAngle = 0;

    data.forEach((key, value) {
      final sweepAngle = (value / total) * 2 * 3.14159;

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = colors[data.keys.toList().indexOf(key) % colors.length];

      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);

      startAngle += sweepAngle;
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


