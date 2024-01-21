import 'package:motodomi_app/lib.dart';

abstract interface class IGetPaymentHistoryService {
  Future<List<PaymentHistory>> get(String deliveryManId);
}
