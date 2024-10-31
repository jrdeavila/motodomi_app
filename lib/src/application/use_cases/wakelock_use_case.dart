import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IListenWakelockUseCase)
class ListenWakelockUseCase implements IListenWakelockUseCase {
  final IWakelockService _wakelockService;

  ListenWakelockUseCase(this._wakelockService);

  @override
  Stream<bool> listenWakelock() {
    return _wakelockService.wakelockStream;
  }
}

@Injectable(as: IEnableWakelockUseCase)
class EnableWakelockUseCase implements IEnableWakelockUseCase {
  final IWakelockService _wakelockService;

  EnableWakelockUseCase(this._wakelockService);

  @override
  Future<void> enableWakelock() {
    return _wakelockService.enable();
  }
}

@Injectable(as: IDisableWakelockUseCase)
class DisableWakelockUseCase implements IDisableWakelockUseCase {
  final IWakelockService _wakelockService;

  DisableWakelockUseCase(this._wakelockService);

  @override
  Future<void> disableWakelock() {
    return _wakelockService.disable();
  }
}

@Injectable(as: IInitializeWakelockUseCase)
class InitializeWakelockUseCase implements IInitializeWakelockUseCase {
  final IWakelockService _wakelockService;

  InitializeWakelockUseCase(this._wakelockService);

  @override
  Future<void> initializeWakelock() {
    return _wakelockService.init();
  }
}

@Injectable(as: IDisposeWakelockUseCase)
class DisposeWakelockUseCase implements IDisposeWakelockUseCase {
  final IWakelockService _wakelockService;

  DisposeWakelockUseCase(this._wakelockService);

  @override
  void disposeWakelock() {
    return _wakelockService.dispose();
  }
}
