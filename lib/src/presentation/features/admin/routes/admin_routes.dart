import 'package:motodomi_app/lib.dart';

abstract class AdminRoutes {
  static const String adminHome = '/admin-home';

  static final routes = [
    GetPage(
      name: adminHome,
      page: () => const AdminHomePage(),
      binding: BindingsBuilder(() {
        Get.put(AdminHomeCtrl());
      }),
    ),
  ];
}
