import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:wisewave/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //signin with email and password and user details to firestore
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      var userData = {
        'name': googleUser.displayName,
        'provider': 'google',
        'photoUrl': googleUser.photoUrl,
        'email': googleUser.email,
      };

      users.doc(user?.uid).set(userData);

      users.doc(user?.uid).get().then((doc) {
        if (doc.exists) {
          // old user
          doc.reference.update(userData);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          // new user

          //users.doc(user?.uid).set(userData);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
      });

      // if (user != null) {
      //   // Add user details to Firebase
      //   // Example: Firestore.instance.collection('users').doc(user.uid).set({
      //   //   'name': user.displayName,
      //   //   'email': user.email,
      //   //   'photoUrl': user.photoURL,
      //   // });

      //   // Navigate to home page
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => HomeScreen(),
      //       ),
      //     );
      // }

      return userCredential;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  // signInWithGoogle() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   await googleSignIn.signOut();

  //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  //   final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   return await FirebaseAuth.instance.signInWithCredential(credential);

  // }
}