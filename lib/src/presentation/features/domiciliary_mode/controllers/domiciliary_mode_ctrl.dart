import 'package:motodomi_app/lib.dart';

class DomiciliaryModeCtrl extends GetxController {
  // ---------------------- Final variables ---------------------
  final _prefs = GetStorage();

  // ---------------------- No Observable ---------------------
  Timer? _timerOperation;
  // ---------------------- Observable ---------------------
  final Rx<DriverRequest?> _driverRequest =
      Rx<DriverRequest?>(DriverRequest.empty());
  final Rx<AppUser?> _user = Rx<AppUser?>(null);
  final RxBool _isInMode = RxBool(false);

  // ---------------------- Getters ---------------------

  // ---------------------- Setters ---------------------

  // ---------------------- Life cycle ---------------------

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  // ---------------------- Private methods ---------------------

  void _init() {
    _isInMode.value = _isInModeValue();
    _prefs.listenKey('domiciliaryMode', (value) {
      _isInMode.value = value;
    });
    _listenOnHome();
    ever(_user, _fetchRequest);
    everAll([
      _isInMode,
      _driverRequest,
    ], _routing);
  }

  void _listenOnHome() {
    Get.find<SessionCtrl>().listenOnHome((p0) {
      _user.value = p0;
      _driverRequest.value = null;
    });
  }

  void _fetchRequest(AppUser? user) async {
    final useCase = getIt<IFetchDriverRequestUseCase>();
    if (user == null) {
      _driverRequest.value = null;
      return;
    }
    _driverRequest.value = await useCase.call(FetchDriverRequestRequest(
      user,
    ));
  }

  void _routing(values) async {
    _timerOperation?.cancel();
    if (_isInMode.value) {
      if (_driverRequest.value == null) {
        Get.offAllNamed(DomiciliaryRoutes.domiciliaryLoading);
        return;
      }
      if (_driverRequest.value?.status == DriverRequestStatus.making) {
        _timerOperation = Timer.periodic(2.seconds, (timer) {
          if (timer.tick == 2) {
            timer.cancel();
            Get.offAllNamed(DomiciliaryRoutes.domiciliaryRequest);
          }
        });

        return;
      }
    }
  }

  void _persistMode() {
    _prefs.write('domiciliaryMode', true);
  }

  bool _isInModeValue() {
    return _prefs.read('domiciliaryMode') ?? false;
  }

  void _leaveMode() {
    _prefs.write('domiciliaryMode', false);
  }

  // ---------------------- Public methods ---------------------
  void cancel() {
    _timerOperation?.cancel();
    Get.offAllNamed(HomeRoutes.home);
    _leaveMode();
  }

  void goToDomiciliaryMode() {
    Get.offAllNamed(DomiciliaryRoutes.domiciliaryLoading);
    _persistMode();
  }

  void cancelWithAlert() {
    showDialog(
      context: Get.context!,
      builder: (_) {
        return AppDialog(
          title: '¿Estás seguro de cancelar?',
          description: "Se perderá el progreso que no hayas guardado.",
          type: AppDialogType.warning,
          actions: [
            TextButton(
              onPressed: () {
                cancel();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Permanecer'),
            ),
          ],
        );
      },
    );
  }
}
