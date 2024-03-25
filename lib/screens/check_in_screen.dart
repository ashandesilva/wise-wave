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
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 107.0, bottom: 80.0),
        decoration: setMainBgGradient(),
        child: StreamBuilder(
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
                child: Text('No check-Ins found.'),
              );
            } else {
              return LiquidPullToRefresh(
                onRefresh: refreshHandler,
                color: const Color(0xFFE5A8B6),
                height: 150,
                backgroundColor: const Color(0xFFB8D7E5),
                animSpeedFactor: 2,
                showChildOpacityTransition: false,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: snapshot.data!.docs.map((document) {
                      return CheckInTile(
                        document: document,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CheckInDetails(document: document),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              );
            }
          },
        ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class CheckInTile extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> document;
  final VoidCallback onPressed;

  const CheckInTile({
    super.key,
    required this.document,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: const Color(0xFFE3F4F7),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  document['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onTap: onPressed,
              ),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Wrap(
                    spacing: 4.0,
                    alignment: WrapAlignment.start,
                    children: document['feelings'].map<Widget>((feeling) {
                      return Chip(
                        label: Text(feeling.toString().split(".")[1]),
                        backgroundColor:
                            const Color.fromARGB(255, 198, 238, 245),
                        side: BorderSide.none,
                        labelStyle: const TextStyle(fontSize: 15),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
