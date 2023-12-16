import 'package:motodomi_app/lib.dart';

abstract class MainRoutes {
  static const String root = '/';
  static const String welcome = '/welcome';

  static final routes = [
    GetPage(
      name: root,
      page: () => const LoadingPage(),
    ),
    GetPage(
      name: welcome,
      page: () => const WelcomePage(),
    ),
  ];
}
