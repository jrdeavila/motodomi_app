import 'package:motodomi_app/lib.dart';

abstract interface class IGetPaymentHistoryUseCase {
  Future<List<PaymentHistory>> get(
    DeliveryManProfile deliveryManProfile,
  );
}
