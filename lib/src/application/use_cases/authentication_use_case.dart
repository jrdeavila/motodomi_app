import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: ILoginUseCase)
class LoginUseCase implements ILoginUseCase {
  final IAuthenticationService _authenticationService;

  LoginUseCase(this._authenticationService);

  @override
  Future<void> login(LoginRequest loginRequest) async {
    return _authenticationService.login(
      email: loginRequest.email,
      password: loginRequest.password,
    );
  }
}

@Injectable(as: ILoginWithGoogleUseCase)
class LoginWithGoogleUseCase implements ILoginWithGoogleUseCase {
  final IGoogleAuthenticationService _authenticationService;

  LoginWithGoogleUseCase(this._authenticationService);

  @override
  Future<void> login() async {
    return _authenticationService.loginWithGoogle();
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
  Future<void> register(RegisterWithGoogleRequest registerWithGoogleRequest) {
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

@Injectable(as: IRegisterUseCase)
class RegisterUseCase implements IRegisterUseCase {
  final IUserRepository _userRepository;
  final IAuthenticationService _authenticationService;

  RegisterUseCase({
    required IUserRepository userRepository,
    required IAuthenticationService authenticationService,
  })  : _userRepository = userRepository,
        _authenticationService = authenticationService;

  @override
  Future<AppUser> register(RegisterRequest registerRequest) async {
    final uuid = await _authenticationService.register(
      email: registerRequest.email,
      password: registerRequest.password,
    );
    final user = AppUser(
        uuid: uuid,
        name: registerRequest.name,
        phone: registerRequest.phone,
        email: registerRequest.email,
        roles: [
          AppUserRole.client,
        ]);
    return _userRepository.createUser(user);
  }
}
