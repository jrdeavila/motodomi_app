import 'package:intl/intl.dart';
import 'package:motodomi_app/lib.dart';

class DriverLicenseCtrl extends GetxController {
  // ----------------------- Properties -----------------------

  final DriverLicenseSection licenseSection;
  final AppUser user;
  // ----------------------- Constructor -----------------------

  DriverLicenseCtrl({
    required this.licenseSection,
    required this.user,
  });

  // ----------------------- No Observables -----------------------
  final licenseNumberFormatter = LicenseInputFormatter();
  final pageCtrl = PageController(initialPage: 0);
  final licenseCtrl = TextEditingController();
  final licenseConfirmedCtrl = TextEditingController();

  // ----------------------- Observables -----------------------

  final RxBool _pageLoading = true.obs;
  final Rx<Uint8List?> _licenseFrontSide = Rx<Uint8List?>(null);
  final Rx<Uint8List?> _licenseBackSide = Rx<Uint8List?>(null);
  final RxBool _loading = false.obs;
  final RxMap<String, String> _errors = RxMap<String, String>({});
  final RxString _licenseNumber = RxString('');
  final Rx<Uint8List?> _licenseConfirmation = Rx<Uint8List?>(null);
  final Rx<DateTime?> _licenseExpirationDate = Rx<DateTime?>(null);

  // ----------------------- Getters -----------------------

  Map<String, String> get errors => _errors;
  bool get loading => _loading.value;
  Uint8List? get licenseFrontSide => _licenseFrontSide.value;
  Uint8List? get licenseBackSide => _licenseBackSide.value;
  Uint8List? get licenseConfirmation => _licenseConfirmation.value;
  String get licenseNumber => _licenseNumber.value;
  String get licenseNumberFormatted =>
      licenseNumberFormatter.format(licenseNumber);
  bool get pageLoading => _pageLoading.value;
  DateTime? get licenseExpirationDate => _licenseExpirationDate.value;
  String? get licenseExpirationDateFormatted {
    if (licenseExpirationDate == null) {
      return null;
    }
    return DateFormat("dd/MM/yyyy").format(licenseExpirationDate!);
  }

  // ----------------------- Setters -----------------------
  void setLicenseExpirationDate(DateTime value) {
    _licenseExpirationDate.value = value;
  }

  // ----------------------- Life Cycle -----------------------

  @override
  void onReady() {
    super.onReady();
    _fetchingData();
    everAll([
      _licenseFrontSide,
      _licenseBackSide,
      _licenseConfirmation,
      _licenseNumber,
    ], _goToResume, condition: () {
      return _licenseFrontSide.value != null &&
          _licenseBackSide.value != null &&
          _licenseConfirmation.value != null &&
          _licenseNumber.value.isNotEmpty;
    });
    ever(_licenseFrontSide, _moveToBackSide);
    ever(_licenseBackSide, _moveToConfirmation);
    ever(_licenseConfirmation, _moveToLicenseNumber);
    ever(_licenseNumber, _moveToResume);
  }

  // ----------------------- Private methods -----------------------

  void _moveToConfirmation(Uint8List? value) {
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

  void _goToResume(callback) {
    Future.delayed(const Duration(milliseconds: 500), () {
      pageCtrl.animateToPage(
        4,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  void _fetchingData() async {
    if (licenseSection.status == SectionStatus.making) {
      _pageLoading.value = false;
      return;
    }
    _licenseNumber.value = licenseSection.driverLicense ?? "";
    _licenseExpirationDate.value =
        licenseSection.driverLicenseExpirationDate != null
            ? DateFormat("dd/MM/yyyy").parse(
                licenseSection.driverLicenseExpirationDate!,
              )
            : null;

    licenseCtrl.text =
        licenseNumberFormatter.format(licenseSection.driverLicense ?? "");

    _licenseFrontSide.value =
        await imageFromNetworkImage(licenseSection.driverLicenseFrontImage!);
    _licenseBackSide.value =
        await imageFromNetworkImage(licenseSection.driverLicenseBackImage!);
    _licenseConfirmation.value =
        await imageFromNetworkImage(licenseSection.driverLicenseConfirmation!);
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

  void _moveToLicenseNumber(Uint8List? value) {
    if (value != null) {
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

  void _moveToResume(String value) {
    if (value.isNotEmpty) {
      pageCtrl.animateToPage(
        4,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      pageCtrl.animateToPage(
        3,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  void _validate() {
    final unformattedLicenseNumber =
        licenseNumberFormatter.unformat(licenseCtrl.text);
    if (unformattedLicenseNumber.length < 12 ||
        unformattedLicenseNumber.length > 20) {
      _errors["license"] = "El número de licencia es inválido";
    }
    if (licenseExpirationDate == null) {
      _errors["expirationDate"] = "Debe seleccionar una fecha";
    }
    if (licenseExpirationDate != null &&
        licenseExpirationDate!.isBefore(DateTime.now())) {
      _errors["expirationDate"] = "La fecha de expiración es inválida";
    } else {
      _errors.remove("license");
      _errors.remove("expirationDate");
    }
  }

  // ----------------------- Public methods -----------------------

  void scanFrontalSide() {
    Get.toNamed(DeviceRoutes.dniScan, arguments: {
      "title": "Escanea el frente de tu Licencia de Conducir",
    })?.then((value) => _licenseFrontSide.value = value as Uint8List?);
  }

  void scanBackSide() {
    Get.toNamed(DeviceRoutes.dniScan, arguments: {
      "title": "Escanea el dorso de tu Licencia de Conducir",
    })?.then((value) => _licenseBackSide.value = value as Uint8List?);
  }

  void scanConfirmation() {
    final useCase = getIt<IPickImage>();
    useCase.takePhoto().then((value) => _licenseConfirmation.value = value);
  }

  void validateLicense() {
    final unformattedLicenseNumber =
        licenseNumberFormatter.unformat(licenseCtrl.text);
    _validate();
    if (_errors.isNotEmpty) {
      return;
    }
    _licenseNumber.value = unformattedLicenseNumber;
  }

  void save() async {
    final useCase = getIt<ISendDriverLicenseSectionUseCase>();
    _loading.value = true;
    if (_errors.isNotEmpty) {
      _loading.value = false;
      return;
    }
    final dniSection = await useCase
        .call(
      SendDriverLicenseSectionRequest(
        driverLicense: licenseNumber,
        driverLicenseExpirationDate: licenseExpirationDateFormatted!,
        driverLicenseConfirmation: licenseConfirmation!,
        driverLicenseFrontImage: licenseFrontSide!,
        driverLicenseBackImage: licenseBackSide!,
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

  void clearBackImage() {
    _licenseBackSide.value = null;
  }

  void clearFrontImage() {
    _licenseFrontSide.value = null;
  }

  void editLicenseNumber() {
    _licenseNumber.value = "";
  }
}
