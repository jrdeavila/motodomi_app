import 'package:motodomi_app/lib.dart';

class SessionCtrl extends GetxController {
  // ----------------------- Observables -----------------------
  final Rx<AppUser?> _user = Rx<AppUser?>(null);
  final RxBool _loading = RxBool(true);
  final RxBool _onHome = RxBool(false);
  final RxBool _isAuthenticated = RxBool(false);

  // ----------------------- Getters -----------------------
  AppUser? get user => _user.value;

  // ----------------------- Setters -----------------------
  void setUser(AppUser? value) => _user.value = value;

  // ----------------------- Life Cycle -----------------------

  @override
  void onReady() {
    super.onReady();
    _whenObservableChanges();
    _listenAuthenticationState();
  }

  // ----------------------- Private Methods -----------------------

  void _whenObservableChanges() {
    ever(_loading, _listenUserChanges);
    ever(_isAuthenticated, _listenAuthenticationChanges);
  }

  void _listenAuthenticationChanges(bool value) async {
    if (value) {
      final useCase = getIt<IGetUserUseCase>();
      _user.value = await useCase.getUser();
    }
    _loading.value = false;
  }

  void _listenUserChanges(bool value) {
    if (!value) {
      if (_user.value == null && !_isAuthenticated.value) {
        Get.offAllNamed(MainRoutes.welcome);
        _onHome.value = false;
        return;
      }

      if (_user.value != null && _isAuthenticated.value) {
        Get.offAllNamed(HomeRoutes.home);
        _onHome.value = true;
        return;
      }

      if (_user.value == null && _isAuthenticated.value) {
        Get.offAllNamed(AuthRoutes.registerWithGoogle);
        _onHome.value = false;
        return;
      }
    } else {
      Get.offAllNamed(MainRoutes.root);
      _onHome.value = false;
    }
  }

  void _listenAuthenticationState() {
    final useCase = getIt<IListenAuthenticationUseCase>();

    useCase.listenAuthenticationState().asyncMap((event) async {
      _loading.value = true;
      final value = await Future.delayed(2.seconds, () => event);
      return value;
    }).listen((event) {
      _isAuthenticated.value = event;
      _isAuthenticated.refresh();
    });
  }

  // ----------------------- Public Methods -----------------------

  void listenOnHome(Function(AppUser user) callback) {
    _onHome.listen((value) {
      if (value) {
        callback(_user.value!);
      }
    });
  }

  void updateAvatar(String? url) {
    _user.value = _user.value?..avatar = url;
  }

  void logout() async {
    final useCase = getIt<ILogoutUseCase>();
    _loading.value = true;
    await Future.wait([
      Future.delayed(1.seconds),
      useCase.logout(),
    ]);

    _user.value = null;
  }

  void reloadSession() {
    _loading.value = true;
    _isAuthenticated.value = true;
    _isAuthenticated.refresh();
  }
}
