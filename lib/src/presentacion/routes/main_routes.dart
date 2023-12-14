import 'package:motodomi_app/lib.dart';

import '../pages/loading.dart';
import '../pages/main.dart';

abstract class MainRoutes {
  static const main = '/main';
  static const loading = "/loading";

  static final routes = [
    GetPage(
      name: main,
      page: () => const Main(),
    ),
    GetPage(
      name: loading,
      page: () => const LoadingPage(),
    ),
  ];
}
