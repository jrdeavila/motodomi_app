import 'package:motodomi_app/lib.dart';

abstract interface class IBalancePaymentService {
  Future<void> rechargeBalance(BalancePayment paymentData);
  Future<PaymentTermsAndConditions> getTermsAndConditions();
}
