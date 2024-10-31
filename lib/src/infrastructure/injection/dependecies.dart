import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:sqflite/sqflite.dart';

// ------------------------------------ Firebase ------------------------------------

@module
abstract class FirebaseAppModule {
  @preResolve
  Future<FirebaseApp> get firebaseApp => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

  @preResolve
  @Named("FirebaseAppForPasswordReset")
  Future<FirebaseApp> get firebaseAppForPasswordReset => Firebase.initializeApp(
        name: "FirebaseAppForPasswordReset",
        options: DefaultFirebaseOptions.currentPlatform,
      );
}

@module
abstract class FirebaseAuthModule {
  @preResolve
  @lazySingleton
  Future<FirebaseAuth> get firebaseAuth async {
    return FirebaseAuth.instanceFor(
      app: getIt<FirebaseApp>(),
    );
  }

  @preResolve
  @Named("FirebaseAuthForPasswordReset")
  @lazySingleton
  Future<FirebaseAuth> get firebaseAuthForPasswordReset async {
    return FirebaseAuth.instanceFor(
      app: getIt<FirebaseApp>(instanceName: "FirebaseAppForPasswordReset"),
    );
  }
}

@module
abstract class FirestoreModule {
  @preResolve
  @lazySingleton
  Future<FirebaseFirestore> get firestore async =>
      FirebaseFirestore.instanceFor(app: getIt<FirebaseApp>());
}

@module
abstract class FirebaseStorageModule {
  @preResolve
  @lazySingleton
  Future<FirebaseStorage> get firebaseStorage async =>
      FirebaseStorage.instanceFor(
        app: getIt<FirebaseApp>(),
        bucket: "gs://motodomi-app.appspot.com",
      );
}

@module
abstract class AppCheckModule {
  @preResolve
  @lazySingleton
  Future<FirebaseAppCheck> get appCheck async {
    final appCheck = FirebaseAppCheck.instanceFor(app: getIt<FirebaseApp>());
    await appCheck.activate(
      androidProvider: AndroidProvider.playIntegrity,
    );
    return appCheck;
  }
}

// ---------------------------------- Google Sign In ----------------------------------
@module
abstract class GoogleSignInModule {
  @preResolve
  @lazySingleton
  Future<GoogleSignIn> get googleSignIn async => GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
}

// ------------------------------------ Facebook ------------------------------------
@module
abstract class FacebookAuthModule {
  @preResolve
  @lazySingleton
  Future<FacebookAuth> get facebookAuth async => FacebookAuth.instance;
}

// ------------------------------------ Dio ------------------------------------

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.addAll([
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.request,
          hitCacheOnErrorExcept: [401, 403],
        ),
      ),
    ]);
}

// ------------------------------------ SQFLite ------------------------------------

@module
abstract class DatabaseModule {
  @preResolve
  @lazySingleton
  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    final path = "$dbPath/travel_point.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS travel_point ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "latitude REAL,"
          "longitude REAL,"
          "address TEXT,"
          "name TEXT,"
          "tag TEXT"
          ")",
        );
      },
    );
  }
}

// ----------------------------- Audio Player --------------------------------
@module
abstract class AudioPlayerModule {
  @lazySingleton
  AudioPlayer get audioPlayer => AudioPlayer();
}

// -------------------------- Flutter Local Notification --------------------------

@module
abstract class FlutterLocalNotificationModule {
  @preResolve
  @lazySingleton
  Future<FlutterLocalNotificationsPlugin>
      get flutterLocalNotificationsPlugin async {
    final plugin = FlutterLocalNotificationsPlugin();
    // Initialization settings for Android and iOS.
    // Note: permissions aren't requested here just to demonstrate that can be
    // done later using the `requestPermissions()` method.
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );
    await plugin.initialize(
      initializationSettings,
    );
    // Request Android permissions for displaying notifications.
    if (Platform.isAndroid) {
      await plugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
    // Request iOS permissions for displaying notifications.
    if (Platform.isIOS) {
      await plugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }

    return plugin;
  }
}

// --------------------------  Camera --------------------------------
@module
abstract class CameraModule {
  @preResolve
  @lazySingleton
  Future<CameraDescription> get camera async {
    final cameras = await availableCameras();
    return cameras.first;
  }
}

//  --------------------------- Payment Module Services ---------------------------

@module
abstract class PaymentModuleServicesModule {
  @preResolve
  @lazySingleton
  Future<HttpGetTokenService> get httpGetTokenService async =>
      HttpGetTokenService(
        dio: getIt<Dio>(),
      );
}

// --------------------------- Screen Brightness ---------------------------

@module
abstract class BrightnessModule {
  @preResolve
  @lazySingleton
  Future<ScreenBrightness> get brightnessService async => ScreenBrightness();
}
