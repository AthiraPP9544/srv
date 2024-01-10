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
    apiKey: 'AIzaSyC-0IefL9WKPmzhjE0cGVkrC7FX3s2EfH4',
    appId: '1:1048924610991:web:63ee7d5cb6973a2cc7cf5a',
    messagingSenderId: '1048924610991',
    projectId: 'otpproject-109db',
    authDomain: 'otpproject-109db.firebaseapp.com',
    storageBucket: 'otpproject-109db.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcjOD_BA4O8zdFO-2RZ3chCHSqGdgNzLI',
    appId: '1:1048924610991:android:b10cd6a63436a1eec7cf5a',
    messagingSenderId: '1048924610991',
    projectId: 'otpproject-109db',
    storageBucket: 'otpproject-109db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPjRbtzkar5vzLE2tFlcQqpW5thTObYr8',
    appId: '1:1048924610991:ios:37184ed963d302d9c7cf5a',
    messagingSenderId: '1048924610991',
    projectId: 'otpproject-109db',
    storageBucket: 'otpproject-109db.appspot.com',
    iosBundleId: 'com.example.apppppppp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPjRbtzkar5vzLE2tFlcQqpW5thTObYr8',
    appId: '1:1048924610991:ios:fa132f3a55282d21c7cf5a',
    messagingSenderId: '1048924610991',
    projectId: 'otpproject-109db',
    storageBucket: 'otpproject-109db.appspot.com',
    iosBundleId: 'com.example.apppppppp.RunnerTests',
  );
}