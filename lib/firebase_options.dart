// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDaEL-YyFF4wOygLZ7Ctg3qb_wdz2aChvk',
    appId: '1:789962775509:web:1bc6811128a1618841fb5c',
    messagingSenderId: '789962775509',
    projectId: 'unique-e-commerce',
    authDomain: 'unique-e-commerce.firebaseapp.com',
    storageBucket: 'unique-e-commerce.firebasestorage.app',
    measurementId: 'G-SZTNPCHPS9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDT2AXMJ8PSwDKqZmMWhHYIrNL5UsQZYQQ',
    appId: '1:789962775509:android:6655914b3280ea1c41fb5c',
    messagingSenderId: '789962775509',
    projectId: 'unique-e-commerce',
    storageBucket: 'unique-e-commerce.firebasestorage.app',
  );

}