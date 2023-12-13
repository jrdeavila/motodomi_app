import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: ICallClientService)
class CallClientService implements ICallClientService {
  final ICallService _callService;

  CallClientService(this._callService);
  @override
  Future<void> call(AppUser client) {
    return _callService.callService(client.phone);
  }
}
