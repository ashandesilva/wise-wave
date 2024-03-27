// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDu0_n9WSdBSHqz4vLgbm-VT-ijCPonvBU',
    appId: '1:410740142462:android:010b054b8a7eafb8c0c32f',
    messagingSenderId: '410740142462',
    projectId: 'wisewavetest',
    storageBucket: 'wisewavetest.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOhDeD70YprsXXftUy6PXM2BfA0V369To',
    appId: '1:410740142462:ios:081e093ba9e3bc89c0c32f',
    messagingSenderId: '410740142462',
    projectId: 'wisewavetest',
    storageBucket: 'wisewavetest.appspot.com',
    androidClientId: '410740142462-fam5imt8ssgdp8eeok3arndo1pg5dvsg.apps.googleusercontent.com',
    iosClientId: '410740142462-si1q89n5rghs9val9mk9ubca4a7uriho.apps.googleusercontent.com',
    iosBundleId: 'com.example.wisewave',
  );
}
