abstract interface class IListenWakelockUseCase {
  Stream<bool> listenWakelock();
}

abstract interface class IEnableWakelockUseCase {
  Future<void> enableWakelock();
}

abstract interface class IDisableWakelockUseCase {
  Future<void> disableWakelock();
}

abstract interface class IInitializeWakelockUseCase {
  Future<void> initializeWakelock();
}

abstract interface class IDisposeWakelockUseCase {
  void disposeWakelock();
}
