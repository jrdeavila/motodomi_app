import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: ISetBrightnessUseCase)
class SetBrightnessUseCase implements ISetBrightnessUseCase {
  final IBrightnessService _brightnessService;

  SetBrightnessUseCase(this._brightnessService);

  @override
  Future<void> setBrightness(double brightness) {
    return _brightnessService.setBrightness(brightness);
  }
}

@Injectable(as: IResetBrightnessUseCase)
class ResetBrightnessUseCase implements IResetBrightnessUseCase {
  final IBrightnessService _brightnessService;

  ResetBrightnessUseCase(this._brightnessService);

  @override
  Future<void> resetBrightness() {
    return _brightnessService.resetBrightness();
  }
}

@Injectable(as: ISetTotalBrightnessUseCase)
class SetTotalBrightnessUseCase implements ISetTotalBrightnessUseCase {
  final IBrightnessService _brightnessService;

  SetTotalBrightnessUseCase(this._brightnessService);

  @override
  Future<void> setTotalBrightness() {
    return _brightnessService.setBrightness(100);
  }
}

@Injectable(as: IListenBrightnessUseCase)
class ListenBrightnessUseCase implements IListenBrightnessUseCase {
  final IBrightnessService _brightnessService;

  ListenBrightnessUseCase(this._brightnessService);

  @override
  Stream<double> listenBrightness() {
    return _brightnessService.brightnessStream;
  }
}

@Injectable(as: IDisposeBrightnessUseCase)
class DisposeBrightnessUseCase implements IDisposeBrightnessUseCase {
  final IBrightnessService _brightnessService;

  DisposeBrightnessUseCase(this._brightnessService);

  @override
  void disposeBrightness() {
    _brightnessService.dispose();
  }
}

@Injectable(as: IInitializeBrightnessUseCase)
class InitializeBrightnessUseCase implements IInitializeBrightnessUseCase {
  final IBrightnessService _brightnessService;

  InitializeBrightnessUseCase(this._brightnessService);

  @override
  Future<void> initializeBrightness() {
    return _brightnessService.init();
  }
}
