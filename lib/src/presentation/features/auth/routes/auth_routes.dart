import 'package:motodomi_app/lib.dart';

abstract class AuthRoutes {
  static const String registerWithGoogle = '/register-with-google';

  static final routes = [
    GetPage(
      name: registerWithGoogle,
      page: () => const RegisterWithGooglePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RegisterWithGoogleCtrl());
      }),
    ),
  ];
}
