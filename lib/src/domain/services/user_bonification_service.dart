import 'package:motodomi_app/lib.dart';

abstract class IClientBonificationService {
  Future<void> updateBonification({
    required AppUser client,
  });
}

abstract class IDriverPaymentService {
  Future<void> updatePayment({
    required double amount,
    required DeliveryManProfile deliveryManProfile,
  });
}

abstract class IDriverBalanceService {
  Future<void> updateBalance({
    required double amount,
    required DeliveryManProfile deliveryManProfile,
  });

  Future<double> getBalance(DeliveryManProfile deliveryMapProfile);

  Stream<double> listenBalance(DeliveryManProfile deliveryMapProfile);
}

abstract class IClientPointsService {
  Future<void> updatePoints({
    required int points,
    required AppUser client,
  });

  Future<int> getPoints(AppUser client);

  Stream<int> listenPoints(AppUser client);
}
