import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';

class CheckInDetails extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> document;

  CheckInDetails({required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Container(
          decoration: setMainBgGradient(),
        ),
        SafeArea(
          child: Column(
            children: [
              AppBar(
                title: const Text('Journal Details'),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: ${document['title']}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Feelings: ${document['feelings'].join(', ')}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Activities: ${document['activities'].join(', ')}',
                      style:const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Mood: ${document['mood']}',
                      style:const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Notes: ${document['notes']}',
                      style:const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
