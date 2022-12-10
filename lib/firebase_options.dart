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
    apiKey: 'AIzaSyDlZHO-ZBxOzXNTzAcN1c_g9gZ8LZlsIFQ',
    appId: '1:622138328729:web:0a8c662c3b723ddd725a08',
    messagingSenderId: '622138328729',
    projectId: 'ordinarioprogramacion-9055b',
    authDomain: 'ordinarioprogramacion-9055b.firebaseapp.com',
    storageBucket: 'ordinarioprogramacion-9055b.appspot.com',
    measurementId: 'G-LZGN9YMZ74',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyfJ89_gWC3QW7WsRXaU2jZd8wQ5eK9D4',
    appId: '1:622138328729:android:15cf73c70d39688a725a08',
    messagingSenderId: '622138328729',
    projectId: 'ordinarioprogramacion-9055b',
    storageBucket: 'ordinarioprogramacion-9055b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyU1zaxjzxUyiTBEVWQYxC4H-7YPnpACE',
    appId: '1:622138328729:ios:db2b88ddff8c532d725a08',
    messagingSenderId: '622138328729',
    projectId: 'ordinarioprogramacion-9055b',
    storageBucket: 'ordinarioprogramacion-9055b.appspot.com',
    iosClientId:
        '622138328729-huh0cot3cf1msu19mcg1kefp9une1uml.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAyU1zaxjzxUyiTBEVWQYxC4H-7YPnpACE',
    appId: '1:622138328729:ios:db2b88ddff8c532d725a08',
    messagingSenderId: '622138328729',
    projectId: 'ordinarioprogramacion-9055b',
    storageBucket: 'ordinarioprogramacion-9055b.appspot.com',
    iosClientId:
        '622138328729-huh0cot3cf1msu19mcg1kefp9une1uml.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
