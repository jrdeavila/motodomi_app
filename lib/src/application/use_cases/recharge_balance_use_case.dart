import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IRechargeBalanceUseCase)
class RechargeBalanceUseCase implements IRechargeBalanceUseCase {
  final IBalancePaymentService _balancePaymentService;

  RechargeBalanceUseCase({
    required IBalancePaymentService balancePaymentService,
  }) : _balancePaymentService = balancePaymentService;

  @override
  Future<void> call(RechargeBalanceParams params) async {
    await _balancePaymentService.rechargeBalance(params.toBalancePayment());
  }
}

@Injectable(as: IGetTermsAndConditionsUseCase)
class GetTermsAndConditionsUseCase implements IGetTermsAndConditionsUseCase {
  final IBalancePaymentService _balancePaymentService;

  GetTermsAndConditionsUseCase({
    required IBalancePaymentService balancePaymentService,
  }) : _balancePaymentService = balancePaymentService;

  @override
  Future<PaymentTermsAndConditions> call() {
    return _balancePaymentService.getTermsAndConditions();
  }
}
