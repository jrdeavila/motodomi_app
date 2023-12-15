import 'package:motodomi_app/lib.dart';

abstract class AuthRoutes {
  static const String login = '/login';
  static const String register = '/register';

  static final routes = [
    GetPage(
      name: login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterPage(),
    ),
  ];
}
