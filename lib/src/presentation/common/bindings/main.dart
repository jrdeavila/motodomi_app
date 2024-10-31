import 'package:motodomi_app/lib.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ExceptionCtrl(), permanent: true);
    Get.put(BannerCtrl(), permanent: true);
    Get.put(SessionCtrl(), permanent: true);
    Get.put(DomiciliaryModeCtrl(), permanent: true);
    Get.put(ThemeCtrl());
    Get.put(InitCtrl());
    Get.put(BrightnessCtrl());
    Get.put(WakelockCtrl());
  }
}
