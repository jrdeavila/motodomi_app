import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@LazySingleton(as: IWakelockService)
class WakelockPlusService implements IWakelockService {
  late final StreamController<bool> _wakelockStatus;

  @override
  Future<void> enable() async {
    await WakelockPlus.enable();
    _setWakelockStatus(true);
  }

  @override
  Future<void> disable() async {
    await WakelockPlus.disable();
    _setWakelockStatus(false);
  }

  void _setWakelockStatus(bool status) {
    _wakelockStatus.add(status);
  }

  @override
  void dispose() {
    _wakelockStatus.close();
  }

  @override
  Stream<bool> get wakelockStream => _wakelockStatus.stream;

  @override
  Future<void> init() async {
    _wakelockStatus = StreamController<bool>.broadcast();
    _wakelockStatus.add(await WakelockPlus.enabled);
  }
}
