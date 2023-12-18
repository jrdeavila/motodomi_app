import 'package:motodomi_app/lib.dart';

class ResetPasswordCtrl extends GetxController {
  // --------------------- Observables ---------------------

  final RxString _email = ''.obs;
  final RxBool _isReady = false.obs;
  final RxBool _loading = false.obs;

  // --------------------- Getters ---------------------

  String get email => _email.value;
  bool get isReady => _isReady.value;
  bool get loading => _loading.value;

  // --------------------- Setters ---------------------

  void setEmail(String value) => _email.value = value;

  // --------------------- Life Cycle ---------------------

  @override
  void onInit() {
    super.onInit();
    debounce(_email, (_) => _validate(),
        time: const Duration(milliseconds: 500));
  }

  // --------------------- Private Methods ---------------------

  void _validate() {
    _isReady.value = _email.value.isNotEmpty;
  }

  // --------------------- Public Methods ---------------------

  void resetPassword() async {
    if (!_isReady.value) return;
    if (_loading.value) return;
    final useCase = getIt<IResetPasswordUseCase>();
    _loading.value = true;
    await Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      useCase
          .call(ResetPasswordRequest(email: _email.value))
          .onError((error, stackTrace) {
        _loading.value = false;
        throw error as Exception;
      }),
    ]);

    _loading.value = false;
    Get.back();
    Get.find<BannerCtrl>().showSuccess(
      "¡Listo!",
      "Se ha enviado un correo electrónico a ${_email.value} con las instrucciones para restablecer tu contraseña.",
    );
  }
}
