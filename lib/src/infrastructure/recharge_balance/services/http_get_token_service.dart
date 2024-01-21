import 'package:dio/dio.dart';
import 'package:motodomi_app/lib.dart';

class HttpGetTokenResponse {
  final String accessToken;
  final String tokenType;

  HttpGetTokenResponse({
    required this.accessToken,
    required this.tokenType,
  });

  factory HttpGetTokenResponse.fromJson(Map<String, dynamic> json) {
    return HttpGetTokenResponse(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
    );
  }
}

class HttpGetTokenService {
  HttpGetTokenResponse? token;
  final Dio _dio;

  HttpGetTokenService({
    required Dio dio,
  }) : _dio = dio {
    _fetchTokenInterval();
  }

  void _fetchTokenInterval() async {
    token = await _getToken();
    Timer.periodic(const Duration(minutes: 1), (Timer t) async {
      token = await _getToken();
      if (token != null) {
        t.cancel();
      }
    });
  }

  Future<HttpGetTokenResponse> _getToken() async {
    final response = await _dio.post(
      '$host/auth/token',
      data: {
        "username": paymentModuleUsername,
        "password": paymentModulePassword,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
      ),
    );
    final data = HttpGetTokenResponse.fromJson(response.data);
    return data;
  }
}
