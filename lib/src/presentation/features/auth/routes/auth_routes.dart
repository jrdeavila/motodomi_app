import 'package:motodomi_app/lib.dart';

abstract class AuthRoutes {
  static const String login = '/login';
  static const String register = '/register';

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
  ];
}
