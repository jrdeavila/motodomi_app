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
    apiKey: 'AIzaSyB4lSzACg9yHOX1FZNaDgjZK5PS-B0_V6k',
    appId: '1:422891690174:android:156299eff76cad0f66e6ef',
    messagingSenderId: '422891690174',
    projectId: 'motodomi-app',
    storageBucket: 'motodomi-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpOV50gemsy489Dd2rexxj64AfvJvHoQ4',
    appId: '1:422891690174:ios:5bc55e4b36c0713466e6ef',
    messagingSenderId: '422891690174',
    projectId: 'motodomi-app',
    storageBucket: 'motodomi-app.appspot.com',
    androidClientId: '422891690174-f21fkckpos88c5tl9rio3n54t1c6c370.apps.googleusercontent.com',
    iosClientId: '422891690174-2akb2bbmsp3cm6f7snqskpc955c5c30m.apps.googleusercontent.com',
    iosBundleId: 'com.example.motodomiApp',
  );
}
