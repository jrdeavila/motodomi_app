import 'package:motodomi_app/lib.dart';

abstract interface class ILoginUseCase {
  Future<void> login(LoginRequest loginRequest);
}

abstract interface class ILoginWithGoogleUseCase {
  Future<void> login();
}

abstract interface class IRegisterWithGoogleUseCase {
  Future<void> register(RegisterWithGoogleRequest registerWithGoogleRequest);
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

abstract interface class IResetPasswordUseCase {
  Future<void> call(ResetPasswordRequest resetPasswordRequest);
}
