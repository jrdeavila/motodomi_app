import 'package:motodomi_app/lib.dart';

class RechargeBalanceParams {
  final String userId;
  final int amount;
  final int? numberPhone;
  final int? accountNumber;
  final PaymentMethodType paymentType;

  RechargeBalanceParams({
    required this.paymentType,
    this.numberPhone,
    this.accountNumber,
    required this.userId,
    required this.amount,
  }) : assert(
          paymentType == PaymentMethodType.nequi
              ? numberPhone != null
              : accountNumber != null,
        );

  BalancePayment toBalancePayment() {
    return BalancePayment(
      amount: amount,
      userId: userId,
      paymentData: paymentType == PaymentMethodType.nequi
          ? NequiPaymentData(
              numberPhone: "${numberPhone!}",
            )
          : BancolombiaPaymentData(
              accountNumber: "${accountNumber!}",
            ),
    );
  }
}
