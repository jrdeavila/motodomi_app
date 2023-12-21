import 'package:motodomi_app/lib.dart';

abstract interface class ILoginWithGoogleUseCase {
  Future<void> login();
}

abstract interface class ILoginWithFacebookUseCase {
  Future<void> login();
}

abstract interface class IRegisterWithGoogleUseCase {
  Future<void> register(RegisterRequest registerWithGoogleRequest);
}

abstract interface class IRegisterWithFacebookUseCase {
  Future<void> register(RegisterRequest registerWithFacebookRequest);
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
