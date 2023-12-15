import 'package:motodomi_app/lib.dart';

class ThemeCtrl extends GetxController {
  // -------------------------- OBSERVABLES --------------------------

  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  // -------------------------- GETTERS --------------------------

  ThemeMode get themeMode => _themeMode.value;

  // -------------------------- SETTERS --------------------------

  void toggleTheme() {
    Get.changeThemeMode(
        themeMode == ThemeMode.system ? ThemeMode.light : ThemeMode.system);
    _themeMode.value = ThemeMode.system;
  }
}
