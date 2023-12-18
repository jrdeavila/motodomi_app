import 'package:motodomi_app/lib.dart';

abstract class AuthRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String registerWithGoogle = '/register-with-google';
  static const String resetPassword = '/reset-password';

  static final routes = [
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginCtrl());
      }),
    ),
    GetPage(
      name: register,
      page: () => const RegisterPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RegisterCtrl());
      }),
    ),
    GetPage(
      name: registerWithGoogle,
      page: () => const RegisterWithGooglePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RegisterWithGoogleCtrl());
      }),
    ),
    GetPage(
      name: resetPassword,
      page: () => const ResetPasswordPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ResetPasswordCtrl());
      }),
    ),
  ];
}
