import 'package:motodomi_app/lib.dart';

abstract class IClientBonificationService {
  Future<void> updateBonification({
    required AppUser client,
  });
}

abstract class IDriverPaymentService {
  Future<void> updatePayment({
    required double amount,
    required AppUser driver,
  });
}

abstract class IDriverBalanceService {
  Future<void> updateBalance({
    required double amount,
    required AppUser driver,
  });

  Future<double> getBalance(AppUser driver);

  Stream<double> listenBalance(AppUser driver);
}

abstract class IClientPointsService {
  Future<void> updatePoints({
    required int points,
    required AppUser client,
  });

  Future<int> getPoints(AppUser client);

  Stream<int> listenPoints(AppUser client);
}
