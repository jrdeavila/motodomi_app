abstract interface class IBrightnessService {
  Future<void> setBrightness(double brightness);

  Future<double> getBrightness();

  Future<void> resetBrightness();

  Stream<double> get brightnessStream;

  void dispose();
  Future<void> init();
}
