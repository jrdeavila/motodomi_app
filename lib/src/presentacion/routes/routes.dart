import 'package:motodomi_app/lib.dart';

import '../pages/authentication/register.dart';

abstract class AuthenticationRoutes {
  static const register = '/register';

  static final routes = [
    GetPage(
      name: register,
      page: () => const Register(),
    ),
  ];
}
