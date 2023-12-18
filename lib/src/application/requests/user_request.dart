class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}

class RegisterRequest {
  final String name;
  final String email;
  final String phone;
  final String password;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });
}

class RegisterWithGoogleRequest {
  final String name;
  final String phone;

  RegisterWithGoogleRequest({
    required this.name,
    required this.phone,
  });
}
