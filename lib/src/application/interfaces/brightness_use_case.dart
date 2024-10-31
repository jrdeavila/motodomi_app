abstract interface class ISetBrightnessUseCase {
  Future<void> setBrightness(double brightness);
}

abstract interface class IResetBrightnessUseCase {
  Future<void> resetBrightness();
}

abstract interface class ISetTotalBrightnessUseCase {
  Future<void> setTotalBrightness();
}

abstract interface class IListenBrightnessUseCase {
  Stream<double> listenBrightness();
}

abstract interface class IDisposeBrightnessUseCase {
  void disposeBrightness();
}

abstract interface class IInitializeBrightnessUseCase {
  Future<void> initializeBrightness();
}
