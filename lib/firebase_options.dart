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
    apiKey: 'AIzaSyDIroDL3yrbB6luCsJ4qV6nrRKrSATGqRs',
    appId: '1:224184214383:web:2263e7d0c6f27c477efe9a',
    messagingSenderId: '224184214383',
    projectId: 'todoapplication-d618e',
    authDomain: 'todoapplication-d618e.firebaseapp.com',
    storageBucket: 'todoapplication-d618e.appspot.com',
    measurementId: 'G-HLKDPRL0NL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUb4fDSnNX8sHfmt9yzgnBBvtgV-77b5k',
    appId: '1:224184214383:android:0fbaa55e36cf78287efe9a',
    messagingSenderId: '224184214383',
    projectId: 'todoapplication-d618e',
    storageBucket: 'todoapplication-d618e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoDTtZ59R1WFU3Kmh5ZYLVQ8x4MZ-NdBw',
    appId: '1:224184214383:ios:df09cc91dfdfe7b27efe9a',
    messagingSenderId: '224184214383',
    projectId: 'todoapplication-d618e',
    storageBucket: 'todoapplication-d618e.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoDTtZ59R1WFU3Kmh5ZYLVQ8x4MZ-NdBw',
    appId: '1:224184214383:ios:c3b3d92320b75d607efe9a',
    messagingSenderId: '224184214383',
    projectId: 'todoapplication-d618e',
    storageBucket: 'todoapplication-d618e.appspot.com',
    iosBundleId: 'com.example.todoApp.RunnerTests',
  );
}
