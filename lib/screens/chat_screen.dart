import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:wisewave/components/theme/nav_bg_gradient.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Assistant', 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 24.0),), 
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Hi, Sarina How can I help you?',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: const [
                  // TODO: Implement messages list
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.grey.withOpacity(0.5),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your message',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // TODO: Implement send message functionality
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
