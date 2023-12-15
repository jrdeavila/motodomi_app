import 'package:motodomi_app/lib.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeCtrl());
    Get.put(InitCtrl());
  }
}
