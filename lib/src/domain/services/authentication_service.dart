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

abstract interface class IChangePasswordService {
  Future<void> changePasswordData({
    required AppUser user,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
}
