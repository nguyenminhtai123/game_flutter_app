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
    apiKey: 'AIzaSyB0GfUIZzezTC3dI7cpYzBQ87L9DjmvAwg',
    appId: '1:242702312475:web:20d0d0d05914ce22a484be',
    messagingSenderId: '242702312475',
    projectId: 'game-app-b3ecc',
    authDomain: 'game-app-b3ecc.firebaseapp.com',
    storageBucket: 'game-app-b3ecc.appspot.com',
    measurementId: 'G-WLTZLBH2PL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPV606lfJJXBHMCmfkT0H-W__FUX8IOEI',
    appId: '1:242702312475:android:177579e3c68a1b93a484be',
    messagingSenderId: '242702312475',
    projectId: 'game-app-b3ecc',
    storageBucket: 'game-app-b3ecc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNH0ZoWURtYf4qQ1gy4OcQu4RE1EDws5w',
    appId: '1:242702312475:ios:ac0b1df1eb3f0cb7a484be',
    messagingSenderId: '242702312475',
    projectId: 'game-app-b3ecc',
    storageBucket: 'game-app-b3ecc.appspot.com',
    iosBundleId: 'com.example.jankenponApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNH0ZoWURtYf4qQ1gy4OcQu4RE1EDws5w',
    appId: '1:242702312475:ios:9a566869ee85be45a484be',
    messagingSenderId: '242702312475',
    projectId: 'game-app-b3ecc',
    storageBucket: 'game-app-b3ecc.appspot.com',
    iosBundleId: 'com.example.jankenponApp.RunnerTests',
  );
}