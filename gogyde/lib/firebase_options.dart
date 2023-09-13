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
    apiKey: 'AIzaSyBmr4pv1ZO7t4n9jmBlTmNowIxwCV7SoOc',
    appId: '1:132591369403:android:9d2a4f60f6b50f169e3d9e',
    messagingSenderId: '132591369403',
    projectId: 'gogyde-550ca',
    databaseURL: 'https://gogyde-550ca-default-rtdb.firebaseio.com',
    storageBucket: 'gogyde-550ca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBotxBaZHYrubfbRaQm1i1YYFejAxpuZCg',
    appId: '1:132591369403:ios:30c4af6ed1482f329e3d9e',
    messagingSenderId: '132591369403',
    projectId: 'gogyde-550ca',
    databaseURL: 'https://gogyde-550ca-default-rtdb.firebaseio.com',
    storageBucket: 'gogyde-550ca.appspot.com',
    androidClientId: '132591369403-3b2n72hbhefg98pjvvkcfugjaav46l38.apps.googleusercontent.com',
    iosClientId: '132591369403-83mor7jmobiu3c1hu9cu1prkfackuab9.apps.googleusercontent.com',
    iosBundleId: 'com.warton.gogyde.gogyde',
  );
}