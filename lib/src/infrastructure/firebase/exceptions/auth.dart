class PasswordDoesNotMatchException implements Exception {
  final String code;
  const PasswordDoesNotMatchException({this.code = 'password-does-not-match'});
}

class GoogleSignInCancelledException implements Exception {}

class FacebookSignInCancelledException implements Exception {}
