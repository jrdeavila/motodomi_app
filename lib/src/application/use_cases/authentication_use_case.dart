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
