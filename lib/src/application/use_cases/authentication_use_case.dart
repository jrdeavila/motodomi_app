import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: ILoginWithGoogleUseCase)
class LoginWithGoogleUseCase implements ILoginWithGoogleUseCase {
  final IGoogleAuthenticationService _authenticationService;

  LoginWithGoogleUseCase(this._authenticationService);

  @override
  Future<void> login() async {
    return _authenticationService.loginWithGoogle();
  }
}

@Injectable(as: ILoginWithFacebookUseCase)
class LoginWithFacebookUseCase implements ILoginWithFacebookUseCase {
  final IFacebookAuthenticationService _authenticationService;

  LoginWithFacebookUseCase(this._authenticationService);

  @override
  Future<void> login() async {
    return _authenticationService.loginWithFacebook();
  }
}

@Injectable(as: IRegisterWithFacebookUseCase)
class RegisterWithFacebookUseCase implements IRegisterWithFacebookUseCase {
  final IUserRepository _userService;
  final IAuthenticationService _authenticationService;
  final IFacebookAuthenticationService _facebookAuthenticationService;

  RegisterWithFacebookUseCase({
    required IUserRepository userService,
    required IAuthenticationService authenticationService,
    required IFacebookAuthenticationService facebookAuthenticationService,
  })  : _userService = userService,
        _authenticationService = authenticationService,
        _facebookAuthenticationService = facebookAuthenticationService;

  @override
  Future<void> register(RegisterRequest registerWithFacebookRequest) {
    final uuid = _authenticationService.getUserUuid();
    final email = _facebookAuthenticationService.getEmail();
    return _userService.createUser(AppUser(
        uuid: uuid,
        name: registerWithFacebookRequest.name,
        phone: registerWithFacebookRequest.phone,
        email: email,
        roles: [
          AppUserRole.client,
        ]));
  }
}

@Injectable(as: IRegisterWithGoogleUseCase)
class RegisterWithGoogleUseCase implements IRegisterWithGoogleUseCase {
  final IUserRepository _userService;
  final IAuthenticationService _authenticationService;
  final IGoogleAuthenticationService _googleAuthenticationService;

  RegisterWithGoogleUseCase({
    required IUserRepository userService,
    required IAuthenticationService authenticationService,
    required IGoogleAuthenticationService googleAuthenticationService,
  })  : _userService = userService,
        _authenticationService = authenticationService,
        _googleAuthenticationService = googleAuthenticationService;

  @override
  Future<void> register(RegisterRequest registerWithGoogleRequest) {
    final uuid = _authenticationService.getUserUuid();
    final email = _googleAuthenticationService.getEmail();
    return _userService.createUser(AppUser(
        uuid: uuid,
        name: registerWithGoogleRequest.name,
        phone: registerWithGoogleRequest.phone,
        email: email,
        roles: [
          AppUserRole.client,
        ]));
  }
}

@Injectable(as: ILogoutUseCase)
class LogoutUseCase implements ILogoutUseCase {
  final IAuthenticationService _authenticationService;

  LogoutUseCase(this._authenticationService);

  @override
  Future<void> logout() {
    return _authenticationService.logout();
  }
}

@Injectable(as: IListenAuthenticationUseCase)
class ListenAuthenticationUseCase implements IListenAuthenticationUseCase {
  final IAuthenticationService _authenticationService;

  ListenAuthenticationUseCase(this._authenticationService);

  @override
  Stream<bool> listenAuthenticationState() {
    return _authenticationService.isAuthenticated();
  }
}

@Injectable(as: IGetUserUseCase)
class GetUserUseCase implements IGetUserUseCase {
  final IAuthenticationService _authenticationService;
  final IUserRepository _userRepository;

  GetUserUseCase({
    required IAuthenticationService authenticationService,
    required IUserRepository userRepository,
  })  : _authenticationService = authenticationService,
        _userRepository = userRepository;

  @override
  Future<AppUser?> getUser() async {
    String uuid = _authenticationService.getUserUuid();
    return _userRepository.getUser(uuid);
  }
}
