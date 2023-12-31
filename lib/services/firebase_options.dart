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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAlfjV-ycjEgU-fTZ27i6HB-bIPEWehlgY',
    appId: '1:517566456573:web:eb4191f0f05361b1fbd494',
    messagingSenderId: '517566456573',
    projectId: 'newswatch-13190',
    authDomain: 'newswatch-13190.firebaseapp.com',
    storageBucket: 'newswatch-13190.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBe37dyMoDtQAw1co-EbjNJZfxypAuyBDY',
    appId: '1:517566456573:android:2d29808d5c1adc8cfbd494',
    messagingSenderId: '517566456573',
    projectId: 'newswatch-13190',
    storageBucket: 'newswatch-13190.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAECBpH_j6A5GO76OSEt6LSizuixAmeBOY',
    appId: '1:517566456573:ios:9c8c87416a97db27fbd494',
    messagingSenderId: '517566456573',
    projectId: 'newswatch-13190',
    storageBucket: 'newswatch-13190.appspot.com',
    iosBundleId: 'com.example.newswatch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAECBpH_j6A5GO76OSEt6LSizuixAmeBOY',
    appId: '1:517566456573:ios:9c8c87416a97db27fbd494',
    messagingSenderId: '517566456573',
    projectId: 'newswatch-13190',
    storageBucket: 'newswatch-13190.appspot.com',
    iosBundleId: 'com.example.newswatch',
  );
}
