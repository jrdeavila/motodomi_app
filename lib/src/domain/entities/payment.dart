class PaymentTermsAndConditions {
  final String termsAndConditionsUrl;
  final String acceptanceToken;

  PaymentTermsAndConditions({
    required this.termsAndConditionsUrl,
    required this.acceptanceToken,
  });
}

abstract class IPaymentData {}

class NequiPaymentData implements IPaymentData {
  final String numberPhone;

  NequiPaymentData({
    required this.numberPhone,
  });
}

class BancolombiaPaymentData implements IPaymentData {
  final String accountNumber;

  BancolombiaPaymentData({
    required this.accountNumber,
  });
}

class BalancePayment {
  int amount;
  String userId;
  IPaymentData paymentData;

  BalancePayment({
    required this.amount,
    required this.userId,
    required this.paymentData,
  });
}
