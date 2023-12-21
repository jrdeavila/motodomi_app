import 'package:motodomi_app/lib.dart';

abstract class IAuthenticationService {
  Future<void> logout();
  Future<void> login({
    required String email,
    required String password,
  });
  Future<String> register({
    required String email,
    required String password,
  });
  Stream<bool> isAuthenticated();
  String getUserUuid();
}

abstract interface class IGoogleAuthenticationService {
  Future<void> loginWithGoogle();
  String getEmail();
}

abstract interface class IFacebookAuthenticationService {
  Future<void> loginWithFacebook();
  String getEmail();
}
