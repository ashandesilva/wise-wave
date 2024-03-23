import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:wisewave/screens/check_in_details.dart';

class CheckInScreen extends StatelessWidget {
  
  //passed uid from nav_page.dart
  final String uid;
  const CheckInScreen({super.key, required this.uid});

  Future<void> refreshHandler() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // new AddCheckInPage(uid) with firestore data
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('check_ins')
            .where('userId', isEqualTo: uid)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No check-ins found.'),
            );
          } else {
            return LiquidPullToRefresh(
              onRefresh: refreshHandler,
              color: const Color.fromARGB(255, 184, 215, 229),
              height: 150,
              backgroundColor: const Color.fromARGB(255, 130, 196, 226),
              animSpeedFactor: 3,
              showChildOpacityTransition: false,
              child: Container(
                decoration: setMainBgGradient(),
                child: ListView(
                    children: [
                      Column(
                        children: snapshot.data!.docs.map((document) {
                          return CheckInTile(
                            document: document,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckInDetails(document: document),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                  ]
                ),
              ),
            );
          }
        },
      ),
    );
  }
  
}

class CheckInTile extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> document;
  final VoidCallback onPressed;

  CheckInTile({required this.document, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: const Color.fromARGB(255, 200, 114, 207),
          child: ListTile(
            title: Text(document['title']),
            subtitle: Text(document['feelings'].join(', ')),
            onTap: onPressed,
          ),
        ),
      ),
    );
  }
}