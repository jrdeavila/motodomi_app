import 'package:motodomi_app/lib.dart';

class RegisterCtrl extends GetxController {
  // --------------------- Observables ---------------------

  final RxString _email = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _code = ''.obs;
  final RxString _name = ''.obs;
  final RxString _password = ''.obs;
  final RxBool _isPasswordVisible = false.obs;
  final RxBool _isReady = false.obs;
  final RxBool _isRememberMe = false.obs;
  final RxBool _loading = false.obs;

  // --------------------- Getters ---------------------

  String get email => _email.value;
  String get phone => _phone.value;
  String get code => _code.value;
  String get name => _name.value;
  String get password => _password.value;
  bool get isPasswordVisible => _isPasswordVisible.value;
  bool get isReady => _isReady.value;
  bool get isRememberMe => _isRememberMe.value;
  bool get loading => _loading.value;

  // --------------------- Setters ---------------------

  void setEmail(String value) => _email.value = value;
  void setPhone(String value) => _phone.value = value;
  void setCode(String value) => _code.value = value;
  void setName(String value) => _name.value = value;
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
    debounce(_phone, (_) => _validate(),
        time: const Duration(milliseconds: 500));
    debounce(_code, (_) => _validate(),
        time: const Duration(milliseconds: 500));
    debounce(_name, (_) => _validate(),
        time: const Duration(milliseconds: 500));
  }

  // --------------------- Private Methods ---------------------

  void _validate() {
    _isReady.value = _email.value.isNotEmpty &&
        _password.value.isNotEmpty &&
        _password.value.length >= 6 &&
        _phone.value.isNotEmpty &&
        _code.value.isNotEmpty &&
        _name.value.isNotEmpty &&
        _phone.value.length >= 10;
  }

  // --------------------- Public Methods ---------------------

  void register() async {
    if (!_isReady.value) return;
    if (_loading.value) return;
    final registerRequest = RegisterRequest(
      phone: "${_code.value} ${_phone.value}",
      email: _email.value,
      name: _name.value,
      password: _password.value,
    );
    final registerUseCase = getIt<IRegisterUseCase>();
    _loading.value = true;
    await Future.wait([
      Future.delayed(1.seconds),
      registerUseCase.register(registerRequest),
    ]);
    _loading.value = false;
  }

  void cancel() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AppDialog(
              title: "Atención",
              description: "Se perdera la información del formulario",
              type: AppDialogType.warning,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(MainRoutes.welcome);
                  },
                  child: const Text("Salir"),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Perminecer"),
                )
              ]);
        });
  }
}
