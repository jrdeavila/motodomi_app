import 'package:motodomi_app/lib.dart';

abstract class HomeRoutes {
  static const String home = '/home';

  static final routes = [
    GetPage(
        name: home,
        page: () => const HomePage(),
        binding: BindingsBuilder(() {
          Get.put(HomeCtrl());
        })),
  ];
}
