import 'package:motodomi_app/lib.dart';

class InitCtrl extends GetxController {
  // ------------------ OBSERVABLES ------------------

  final _loading = false.obs;

  // ------------------ GETTERS ------------------

  bool get loading => _loading.value;

  // ------------------ LYFECYCLE ------------------

  @override
  void onReady() {
    super.onReady();
    ever(_loading, _routing);
  }

  // ------------------ PRIVATE METHODS ------------------

  void _routing(bool loading) {
    if (loading) {
      Get.offAllNamed(MainRoutes.root);
    } else {
      Get.offAllNamed(MainRoutes.welcome);
    }
  }

  // ----------------- PUBLIC METHODS ------------------

  void loginWithFacebook() async {
    final loginUseCase = getIt<ILoginWithFacebookUseCase>();
    _loading.value = true;
    await Future.wait([
      Future.delayed(1.seconds),
      loginUseCase.login().onError((error, stackTrace) {
        _loading.value = false;
        throw error as Exception;
      }),
    ]);
    _loading.value = false;
  }

  void loginWithGoogle() async {
    final loginUseCase = getIt<ILoginWithGoogleUseCase>();
    _loading.value = true;
    await Future.wait([
      Future.delayed(1.seconds),
      loginUseCase.login().onError((error, stackTrace) {
        _loading.value = false;
        throw error as Exception;
      }),
    ]);
    _loading.value = false;
  }
}
