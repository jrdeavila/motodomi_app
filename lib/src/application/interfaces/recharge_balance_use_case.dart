import 'package:motodomi_app/lib.dart';

abstract interface class IRechargeBalanceUseCase {
  Future<void> call(RechargeBalanceParams params);
}

abstract interface class IGetTermsAndConditionsUseCase {
  Future<PaymentTermsAndConditions> call();
}
