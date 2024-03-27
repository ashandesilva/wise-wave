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
                titleTextStyle: const TextStyle(color: Colors.black, fontSize: 26),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: ${document['title']}',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        children: [
                          const TextSpan(
                            text: 'Feelings: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ...document['feelings'].map((feeling) {
                            return TextSpan(
                              text: '${feeling.toString().split('.')[1]}, ',
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        children: [
                          const TextSpan(
                            text: 'Activities: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ...document['activities'].map((activities) {
                            return TextSpan(
                              text: '${activities.toString().split('.')[1]}, ',
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Mood: ',
                          style: TextStyle(fontSize: 20, fontWeight:
                          FontWeight.bold,
                          color: Colors.black),
                        ),
                        TextSpan(
                          text: '${document['mood']}',
                          style: const TextStyle(fontSize: 20,
                          color: Colors.black),
                        ),
                      ],
                    ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Notes: ',
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                        ),
                        TextSpan(
                          text: '${document['notes']}',
                          style: const TextStyle(fontSize: 20,
                          color: Colors.black),
                        ),
                      ],
                    ),
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
