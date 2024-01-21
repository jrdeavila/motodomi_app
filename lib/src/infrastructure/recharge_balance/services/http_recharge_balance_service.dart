import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IBalancePaymentService)
class HttpRechargeBalanceService implements IBalancePaymentService {
  final Dio _dio;
  final HttpGetTokenService _getTokenService;

  HttpRechargeBalanceService({
    required Dio dio,
    required HttpGetTokenService getTokenService,
  })  : _dio = dio,
        _getTokenService = getTokenService;
  @override
  Future<void> rechargeBalance(BalancePayment balancePayment) {
    final data = balancePaymentToJson(balancePayment);
    return _dio.post(
      '$host/payment/',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${_getTokenService.token?.accessToken}'
      }),
      data: data,
    );
  }

  @override
  Future<PaymentTermsAndConditions> getTermsAndConditions() {
    return _dio
        .get("$host/terms-and-conditions/",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${_getTokenService.token?.accessToken}'
            }))
        .then((value) {
      final wompiAccepctanceToken =
          HttpTermsAndConditionsResponse.fromJson(value.data);
      return PaymentTermsAndConditions(
        acceptanceToken: wompiAccepctanceToken.token,
        termsAndConditionsUrl: wompiAccepctanceToken.link,
      );
    });
  }
}

Map<String, dynamic> balancePaymentToJson(BalancePayment instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'payment_type': (() {
        if (instance.paymentData is NequiPaymentData) {
          return 'Nequi';
        }
        if (instance.paymentData is BancolombiaPaymentData) {
          return 'Bancolombia';
        }
      })(),
      'user_id': instance.userId,
      'payment_data': (() {
        if (instance.paymentData is NequiPaymentData) {
          return {
            'number_phone':
                (instance.paymentData as NequiPaymentData).numberPhone,
          };
        }
        if (instance.paymentData is BancolombiaPaymentData) {
          return {
            'account_number':
                (instance.paymentData as BancolombiaPaymentData).accountNumber,
          };
        }
      })(),
    };
