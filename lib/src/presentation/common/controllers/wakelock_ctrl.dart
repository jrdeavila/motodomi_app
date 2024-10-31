import 'package:motodomi_app/lib.dart';

class WakelockCtrl extends GetxController {
  final RxBool _isWakelockEnabled = false.obs;

// ==================== Getters ====================
  bool get isWakelockEnabled => _isWakelockEnabled.value;

// ==================== Lifecycle ====================

  @override
  void onInit() {
    super.onInit();
    _initializeWakelock();
    _listenWakelock();
  }

  @override
  void onClose() {
    _disposeWakelock();
    _isWakelockEnabled.close();
    super.onClose();
  }

// ==================== Private methods ====================

  void _initializeWakelock() {
    final useCase = getIt<IInitializeWakelockUseCase>();

    useCase.initializeWakelock();
  }

  void _disposeWakelock() {
    final useCase = getIt<IDisposeWakelockUseCase>();
    useCase.disposeWakelock();
  }

  void _listenWakelock() {
    final useCase = getIt<IListenWakelockUseCase>();
    _isWakelockEnabled.bindStream(useCase.listenWakelock());
  }

  // ==================== Public methods ====================

  void enableWakelock() {
    final useCase = getIt<IEnableWakelockUseCase>();
    useCase.enableWakelock();
  }

  void disableWakelock() {
    final useCase = getIt<IDisableWakelockUseCase>();
    useCase.disableWakelock();
  }
}
