import 'package:motodomi_app/lib.dart';

class LoginCtrl extends GetxController {
  // --------------------- Variables ---------------------
  final GetStorage _prefs = GetStorage();
  // --------------------- Observables ---------------------

  final RxString _email = ''.obs;
  final RxString _password = ''.obs;
  final RxBool _isPasswordVisible = false.obs;
  final RxBool _isReady = false.obs;
  final RxBool _isRememberMe = false.obs;
  final RxBool _loading = false.obs;

  // --------------------- Getters ---------------------

  String get email => _email.value;
  String get password => _password.value;
  bool get isPasswordVisible => _isPasswordVisible.value;
  bool get isReady => _isReady.value;
  bool get isRememberMe => _isRememberMe.value;
  bool get loading => _loading.value;

  // --------------------- Setters ---------------------

  void setEmail(String value) => _email.value = value;
  void setPassword(String value) => _password.value = value;
  void toggleRememberMe(bool? value) => _isRememberMe.value = value ?? false;
  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  // --------------------- Life Cycle ---------------------

  @override
  void onInit() {
    super.onInit();
    debounce(_email, (_) => _validate(),
        time: const Duration(milliseconds: 500));
    debounce(_password, (_) => _validate(),
        time: const Duration(milliseconds: 500));
    _loadRememberMe();
  }

  // --------------------- Private Methods ---------------------

  void _loadRememberMe() {
    _email.value = _prefs.read('email') ?? '';
    _password.value = _prefs.read('password') ?? '';
    _isRememberMe.value = _prefs.read('rememberMe') ?? false;
  }

  void _validate() {
    _isReady.value = _email.value.isNotEmpty && _password.value.isNotEmpty;
  }

  void _rememberMe() {
    _prefs.write('email', _email.value);
    _prefs.write('password', _password.value);
    _prefs.write('rememberMe', _isRememberMe.value);
  }

  // --------------------- Public Methods ---------------------

  void login() async {
    if (!_isReady.value) return;
    if (_loading.value) return;
    if (_isRememberMe.value) _rememberMe();
    final loginRequest = LoginRequest(
      email: _email.value,
      password: _password.value,
    );
    final loginUseCase = getIt<ILoginUseCase>();
    _loading.value = true;
    await Future.wait([
      Future.delayed(1.seconds),
      loginUseCase.login(loginRequest),
    ]);

    _loading.value = false;
  }

  void goToForgotPassword() {}
}
