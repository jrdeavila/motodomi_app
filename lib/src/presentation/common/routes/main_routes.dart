import 'package:motodomi_app/lib.dart';

abstract class MainRoutes {
  static const String root = '/';

  static final routes = [
    GetPage(
      name: root,
      page: () => const AppPage(),
    ),
  ];
}
