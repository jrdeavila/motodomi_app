import 'package:motodomi_app/lib.dart';

class BrightnessCtrl extends GetxController {
  RxDouble _brightness = 0.0.obs;

// ==================== Getters ====================

  double get brightness => _brightness.value;

// ==================== Lifecycle ====================

  @override
  void onInit() {
    super.onInit();
    _initializeBrightness();
    _listenBrightness();
  }

  @override
  void onClose() {
    _disposeBrightness();
    _brightness.close();
    super.onClose();
  }

// ==================== Private methods ====================
  void _initializeBrightness() {
    final useCase = getIt<IInitializeBrightnessUseCase>();
    useCase.initializeBrightness();
  }

  void _disposeBrightness() {
    final useCase = getIt<IDisposeBrightnessUseCase>();
    useCase.disposeBrightness();
  }

  void _listenBrightness() {
    final useCase = getIt<IListenBrightnessUseCase>();
    _brightness.bindStream(useCase.listenBrightness());
  }

  // ==================== Public methods ====================

  void setBrightness(double brightness) {
    final useCase = getIt<ISetBrightnessUseCase>();
    useCase.setBrightness(brightness);
  }

  void resetBrightness() {
    final useCase = getIt<IResetBrightnessUseCase>();
    useCase.resetBrightness();
  }

  void setTotalBrightness() {
    final useCase = getIt<ISetTotalBrightnessUseCase>();
    useCase.setTotalBrightness();
  }
}
