import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SayThanksPage extends StatelessWidget {

  //passed uid from nav_page.dart
  final String uid;
  final _gratitudeController = TextEditingController();
  SayThanksPage({Key? key, required this.uid}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Say thanks'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${DateTime.now().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _gratitudeController,
              decoration: InputDecoration(
                hintText: 'Today I am grateful for...',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('gratitude').add({
                  'userId': uid,
                  'date': DateTime.now(),
                  'gratitude': _gratitudeController.text,
                  }).then((_) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Always remember to be thankful ❤️')),
                    );
                });
              },
              child: Text('Say thanks'),
            ),
          ],
        ),
      ),
    );
  }
}