import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@LazySingleton(as: IBrightnessService)
class ScreenBrightnessService implements IBrightnessService {
  final ScreenBrightness _brightness;
  // Stream to listen to changes in brightness
  late final StreamController<double> _brightnessStreamController;

  ScreenBrightnessService(this._brightness);

  @override
  Future<double> getBrightness() {
    return _brightness.application.then((value) => value * 100);
  }

  @override
  Future<void> resetBrightness() {
    return _brightness.resetApplicationScreenBrightness();
  }

  // Assert brightness is between 0 and 100
  // Set the brightness using the setApplicationScreenBrightness method
  @override
  Future<void> setBrightness(double brightness) {
    assert(brightness >= 0 && brightness <= 100);
    final percent = brightness / 100;
    _onBrightnessChanged(brightness);
    return _brightness.setApplicationScreenBrightness(percent);
  }

  void _onBrightnessChanged(double brightness) {
    _brightnessStreamController.add(brightness);
  }

  @override
  Stream<double> get brightnessStream => _brightnessStreamController.stream;

  @override
  void dispose() {
    _brightnessStreamController.close();
  }

  @override
  Future<void> init() async {
    _brightnessStreamController = StreamController<double>.broadcast();
    _brightnessStreamController.add(await getBrightness());
  }
}
