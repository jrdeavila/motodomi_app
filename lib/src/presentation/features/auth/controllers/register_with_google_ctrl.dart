import 'package:motodomi_app/lib.dart';

class RegisterWithGoogleCtrl extends GetxController {
  // --------------------- Observables ---------------------

  final RxString _phone = ''.obs;
  final RxString _code = ''.obs;
  final RxString _name = ''.obs;
  final RxBool _isReady = false.obs;
  final RxBool _loading = false.obs;

  // --------------------- Getters ---------------------

  String get phone => _phone.value;
  String get code => _code.value;
  String get name => _name.value;
  bool get isReady => _isReady.value;
  bool get loading => _loading.value;

  // --------------------- Setters ---------------------

  void setPhone(String value) => _phone.value = value;
  void setCode(String value) => _code.value = value;
  void setName(String value) => _name.value = value;

  // --------------------- Life Cycle ---------------------

  @override
  void onInit() {
    super.onInit();
    debounce(_phone, (_) => _validate(),
        time: const Duration(milliseconds: 500));
    debounce(_code, (_) => _validate(),
        time: const Duration(milliseconds: 500));
    debounce(_name, (_) => _validate(),
        time: const Duration(milliseconds: 500));
  }

  // --------------------- Private Methods ---------------------

  void _validate() {
    _isReady.value = _phone.value.isNotEmpty &&
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
      name: _name.value,
    );
    final registerUseCase = getIt<IRegisterWithGoogleUseCase>();
    _loading.value = true;

    await Future.delayed(1.seconds);
    await Future.wait([
      registerUseCase.register(registerRequest),
    ]);

    Get.find<SessionCtrl>().reloadSession();
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
