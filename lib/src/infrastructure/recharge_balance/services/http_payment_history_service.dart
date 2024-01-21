import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IGetPaymentHistoryService)
class HttpGetPaymentHistoryService implements IGetPaymentHistoryService {
  final Dio _dio;
  final HttpGetTokenService _getTokenService;

  HttpGetPaymentHistoryService({
    required Dio dio,
    required HttpGetTokenService getTokenService,
  })  : _dio = dio,
        _getTokenService = getTokenService;

  @override
  Future<List<PaymentHistory>> get(
    String deliveryManId,
  ) async {
    final response = await _dio.get('$host/user/$deliveryManId/payments',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_getTokenService.token?.accessToken}'
        }));
    final data = response.data as List;
    return data.map((e) => paymentHistoryFromJson(e)).toList();
  }
}

PaymentHistory paymentHistoryFromJson(Map<String, dynamic> json) {
  return PaymentHistory(
    id: json['id'] as String,
    reference: json['reference'] as String,
    status: (() {
      switch (json['status'] as String) {
        case 'PENDING':
          return PaymentStatus.pending;
        case 'APPROVED':
          return PaymentStatus.approved;
        case 'DECLINED':
          return PaymentStatus.declined;
        default:
          return PaymentStatus.pending;
      }
    })(),
    amount: json['amount'] as int,
    paymentData: PaymentData(
      paymentType: json['payment_data']['payment_type'] == 'Nequi'
          ? PaymentMethodType.nequi
          : PaymentMethodType.bancolombiaALaMano,
    ),
    userId: json['user_id'] as String,
  );
}
