import 'package:flutter/material.dart';

class SayThanksPage extends StatelessWidget {

  //passed uid from nav_page.dart
  final String uid;
  const SayThanksPage({super.key, required this.uid});

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
              decoration: InputDecoration(
                hintText: 'Today I am grateful for...',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement say thanks functionality
              },
              child: Text('Say thanks'),
            ),
          ],
        ),
      ),
    );
  }
}