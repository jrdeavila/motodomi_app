enum PaymentStatus {
  pending,
  approved,
  declined,
}

class PaymentHistory {
  String id;
  String reference;
  int amount;
  String userId;
  PaymentStatus status;
  PaymentData paymentData;

  PaymentHistory({
    required this.id,
    required this.reference,
    required this.amount,
    required this.userId,
    required this.status,
    required this.paymentData,
  });
}

enum PaymentMethodType {
  nequi,
  bancolombiaALaMano,
}

class PaymentData {
  PaymentMethodType paymentType;

  PaymentData({
    required this.paymentType,
  });
}
