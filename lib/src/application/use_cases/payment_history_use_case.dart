import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IGetPaymentHistoryUseCase)
class GetPaymenHistoryUseCase implements IGetPaymentHistoryUseCase {
  final IGetPaymentHistoryService _getPaymentHistoryService;

  GetPaymenHistoryUseCase(this._getPaymentHistoryService);
  @override
  Future<List<PaymentHistory>> get(DeliveryManProfile deliveryManProfile) {
    return _getPaymentHistoryService.get(deliveryManProfile.uuid);
  }
}
