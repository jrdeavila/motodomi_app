import 'package:motodomi_app/lib.dart';

class InitCtrl extends GetxController {
  // -------------------- Public Methods --------------------

  void goToLogin() => Get.toNamed(AuthRoutes.login);
  void goToRegister() => Get.toNamed(AuthRoutes.register);
}
