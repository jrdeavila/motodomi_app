import 'package:motodomi_app/lib.dart';

class OwnerShipCardCtrl extends GetxController {
  // ----------------------- Properties -----------------------

  final OwnerShipCardSection ownerShipCardSection;
  final AppUser user;
  // ----------------------- Constructor -----------------------

  OwnerShipCardCtrl({
    required this.ownerShipCardSection,
    required this.user,
  });

  // ----------------------- No Observables -----------------------
  final pageCtrl = PageController(initialPage: 0);

  // ----------------------- Observables -----------------------

  final RxBool _pageLoading = true.obs;
  final Rx<Uint8List?> _ownerShipCardFrontSide = Rx<Uint8List?>(null);
  final Rx<Uint8List?> _ownerShipCardBackSide = Rx<Uint8List?>(null);
  final RxBool _loading = false.obs;

  // ----------------------- Getters -----------------------

  bool get loading => _loading.value;
  Uint8List? get onwerShipCardFrontSide => _ownerShipCardFrontSide.value;
  Uint8List? get onwerShipCardBackSide => _ownerShipCardBackSide.value;
  bool get pageLoading => _pageLoading.value;

  // ----------------------- Life Cycle -----------------------

  @override
  void onReady() {
    super.onReady();
    _fetchingData();
    everAll([
      _ownerShipCardFrontSide,
      _ownerShipCardBackSide,
    ], _goToResume, condition: () {
      return _ownerShipCardFrontSide.value != null &&
          _ownerShipCardBackSide.value != null;
    });
    ever(_ownerShipCardFrontSide, _moveToBackSide);
    ever(_ownerShipCardBackSide, _moveToResume);
  }

  // ----------------------- Private methods -----------------------

  void _moveToResume(Uint8List? value) {
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
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  void _fetchingData() async {
    if (ownerShipCardSection.status == SectionStatus.making) {
      _pageLoading.value = false;
      return;
    }

    _ownerShipCardFrontSide.value = await imageFromNetworkImage(
        ownerShipCardSection.ownershipCardFrontImage!);
    _ownerShipCardBackSide.value = await imageFromNetworkImage(
        ownerShipCardSection.ownershipCardBackImage!);

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

  // ----------------------- Public methods -----------------------

  void scanFrontalSide() {
    Get.toNamed(DeviceRoutes.dniScan, arguments: {
      "title": "Escanea el frente de tu tarjeta de propiedad",
    })?.then((value) => _ownerShipCardFrontSide.value = value as Uint8List?);
  }

  void scanBackSide() {
    Get.toNamed(DeviceRoutes.dniScan, arguments: {
      "title": "Escanea el dorso de tu tarjeta de propiedad",
    })?.then((value) => _ownerShipCardBackSide.value = value as Uint8List?);
  }

  void save() async {
    final useCase = getIt<ISendOwnerShipCardSectionUseCase>();
    _loading.value = true;

    final dniSection = await useCase
        .call(
      SendOwnerShipCardSectionRequest(
        ownerShipCardBackImage: _ownerShipCardBackSide.value!,
        ownerShipCardFrontImage: _ownerShipCardFrontSide.value!,
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
    _ownerShipCardBackSide.value = null;
  }

  void clearFrontImage() {
    _ownerShipCardFrontSide.value = null;
  }
}
