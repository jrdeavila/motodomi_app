import 'package:motodomi_app/lib.dart';

abstract interface class ILoginUseCase {
  Future<void> login(LoginRequest loginRequest);
}

abstract interface class ILogoutUseCase {
  Future<void> logout();
}

abstract interface class IListenAuthenticationUseCase {
  Stream<bool> listenAuthenticationState();
}

abstract interface class IGetUserUseCase {
  Future<AppUser?> getUser();
}

abstract interface class IRegisterUseCase {
  Future<void> register(RegisterRequest registerRequest);
}
