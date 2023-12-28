import 'package:motodomi_app/lib.dart';

class DNICtrl extends GetxController {
  // -------------------------- Final or const variables -------------------------
  final DNISection dniSection;
  final AppUser user;

  // ---------------------------- Constructor ------------------------------------

  DNICtrl({
    required this.dniSection,
    required this.user,
  });

  // ---------------------------- No Observable ----------------------------------

  final PageController pageCtrl = PageController(initialPage: 0);
  final TextEditingController dniNumberCtrl = TextEditingController();
  final DNIInputFormatter dniNumberFormatter = DNIInputFormatter(
    segment: 3,
    separator: " . ",
  );

  // ---------------------------- Observables ------------------------------------

  final RxString _dniNumber = "".obs;
  final Rx<Uint8List?> _dniFront = Rx<Uint8List?>(null);
  final Rx<Uint8List?> _dniBack = Rx<Uint8List?>(null);
  final RxMap<String, dynamic> _errors = RxMap<String, dynamic>({});
  final RxBool _loading = false.obs;
  final RxBool _pageLoading = true.obs;

  // ---------------------------- Getters and Setters ----------------------------

  String get dniNumber => _dniNumber.value;
  Uint8List? get dniFront => _dniFront.value;
  Uint8List? get dniBack => _dniBack.value;
  Map<String, dynamic> get errors => _errors;

  String get dniNumberFormatted => dniNumberFormatter.format(dniNumber);

  bool get loading => _loading.value;
  bool get pageLoading => _pageLoading.value;

  // ---------------------------- Lyfecycles ------------------------------------

  @override
  void onReady() {
    super.onReady();
    _fetchingData();
    everAll([
      _dniBack,
      _dniFront,
      _dniNumber,
    ], _goToResume, condition: () {
      return _dniBack.value != null &&
          _dniFront.value != null &&
          _dniNumber.value.isNotEmpty;
    });
    ever(_dniFront, _moveToBackSide);
    ever(_dniBack, _moveToDigit);
    ever(_dniNumber, _moveToResume);
  }

  void _goToResume(callback) {
    Future.delayed(const Duration(milliseconds: 500), () {
      pageCtrl.animateToPage(
        3,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  // ---------------------------- Private Methods -------------------------------

  void _fetchingData() async {
    if (dniSection.status == SectionStatus.making) {
      _pageLoading.value = false;
      return;
    }
    _dniNumber.value = dniSection.dni ?? "";
    dniNumberCtrl.text = dniNumberFormatter.format(dniSection.dni!);
    _dniFront.value = await imageFromNetworkImage(dniSection.dniFrontImage!);
    _dniBack.value = await imageFromNetworkImage(dniSection.dniBackImage!);
    _pageLoading.value = false;
  }

  void _moveToBackSide(Uint8List? value) {
    if (value != null) {
      pageCtrl.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      pageCtrl.animateToPage(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  void _moveToDigit(Uint8List? value) {
    if (value != null) {
      pageCtrl.animateToPage(
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      pageCtrl.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  void _moveToResume(String value) {
    if (value.isNotEmpty) {
      pageCtrl.animateToPage(
        3,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      pageCtrl.animateToPage(
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  void _validate() {
    final formatedDNI = dniNumberFormatter.unformat(dniNumberCtrl.text);
    if (formatedDNI.length >= 8 && formatedDNI.length <= 10) {
      _errors.remove("dni");
    } else {
      _errors["dni"] = "El número de identificación es inválido";
    }
  }

  // ---------------------------- Public Methods --------------------------------

  void scanFrontalSideIdentification() {
    Get.toNamed(DeviceRoutes.dniScan, arguments: {
      "title": "Escanea el frente de tu Identificación",
    })?.then((value) => _dniFront.value = value as Uint8List?);
  }

  void scanBackSideIdentification() {
    Get.toNamed(DeviceRoutes.dniScan, arguments: {
      "title": "Escanea el dorso de tu Identificación",
    })?.then((value) => _dniBack.value = value as Uint8List?);
  }

  void validateDNI() {
    final formatedDNI = dniNumberFormatter.unformat(dniNumberCtrl.text);
    _validate();
    if (_errors.isNotEmpty) {
      return;
    }
    _dniNumber.value = formatedDNI;
  }

  void clearFrontImage() {
    _dniFront.value = null;
  }

  void clearBackImage() {
    _dniBack.value = null;
  }

  void editDNI() {
    _dniNumber.value = "";
  }

  void save() async {
    final useCase = getIt<ISendDNISectionUseCase>();
    _loading.value = true;
    if (_errors.isNotEmpty) {
      _loading.value = false;
      return;
    }
    final dniSection = await useCase
        .call(
      SendDNISectionRequest(
        dni: dniNumber,
        dniFrontImage: dniFront!,
        dniBackImage: dniBack!,
        userUuid: user.uuid,
      ),
    )
        .onError((error, stackTrace) {
      _loading.value = false;
      throw error as Exception;
    }).whenComplete(() => _loading.value = false);

    Get.back();
    Get.find<DomiciliaryRequestCtrl>().updateSection(dniSection);
  }
}
