import 'package:motodomi_app/lib.dart';

class AboutCarCtrl extends GetxController {
  final AboutCarSection aboutCarSection;
  final AppUser user;

  // ------------------------- Constructor -------------------------

  AboutCarCtrl({
    required this.aboutCarSection,
    required this.user,
  });

  // ----------------------- No Observable -----------------------

  final pageController = PageController(initialPage: 0);

  // ----------------------- Life Cycle -----------------------

  @override
  void onReady() {
    super.onReady();
    var firstKey = carBrandAndModels.keys.first;
    _carBrand.value = aboutCarSection.carBrand ?? firstKey;
    _carModel.value =
        aboutCarSection.carModel ?? carBrandAndModels[firstKey]?.first ?? "";
    _carPlate.value = aboutCarSection.carPlate ?? "";

    if (aboutCarSection.carImage != null) {
      imageFromNetworkImage(aboutCarSection.carImage!)
          .then((value) => _image.value = value);
    }

    carPlateCtrl.text = aboutCarSection.carPlate ?? "";
    ever(
      _image,
      _goToResume,
    );

    debounce(_carBrand, (_) => _validate());
    debounce(_carModel, (_) => _validate());
    debounce(_carPlate, (_) => _validate());
    debounce(_image, (_) => _validate());
  }

  // ------------------------- No Observable -------------------------

  final carPlateCtrl = TextEditingController();

  // ------------------------- Observables -------------------------

  final RxString _carBrand = ''.obs;
  final RxString _carModel = ''.obs;
  final RxString _carPlate = ''.obs;
  final Rx<Uint8List?> _image = Rx<Uint8List?>(null);

  final RxMap<String, String> _errors = RxMap<String, String>();
  final RxBool _loading = false.obs;
  final RxBool _pageLoading = false.obs;

  // ------------------------- Getters ---------------------------

  bool get pageLoading => _pageLoading.value;
  String get carBrand => _carBrand.value;
  String get carModel => _carModel.value;
  String get carPlate => _carPlate.value;
  Uint8List? get image => _image.value;
  Map<String, List<String>> get carBrandAndModels => {
        ...vehicleBrandsAndModels,
      };

  Map<String, String> get errors => _errors;
  bool get loading => _loading.value;
  String get carPlateFormatted => CarPlateFormatter.format(carPlate);

  // ------------------------- Setters ---------------------------

  set carBrand(String value) => _carBrand.value = value;
  set carModel(String value) => _carModel.value = value;
  set carPlate(String value) =>
      _carPlate.value = CarPlateFormatter.unformat(value);

  // ------------------------- Private Methods -------------------------

  void _validate() {
    _errors.clear();

    if (_carBrand.value.isEmpty) {
      _errors['carBrand'] = 'Este campo es requerido';
    }
    if (_carModel.value.isEmpty) {
      _errors['carModel'] = 'Este campo es requerido';
    }
    if (_carPlate.value.isEmpty) {
      _errors['carPlate'] = 'Este campo es requerido';
    }
  }

  void _pickImageFromCamera() {
    final service = getIt<IPickImage>();
    service.takePhoto().then((value) {
      _image.value = value;
      _image.refresh();
    });
  }

  void _pickImageFromGallery() {
    final service = getIt<IPickImage>();
    service.pickImage().then((value) {
      _image.value = value;
      _image.refresh();
    });
  }

  void _removeImage() {
    _image.value = null;
  }

  void _goToResume(value) {
    if (value is Uint8List) {
      pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // ------------------------- Public Methods ----------------------------

  void pickImage() async {
    showModalBottomSheet(
        context: Get.context!,
        builder: (_) {
          return PickerSelectionModal(
            canRemove: _image.value != null,
            onSelect: (value) {
              switch (value) {
                case PickerSelection.camera:
                  return _pickImageFromCamera();
                case PickerSelection.gallery:
                  return _pickImageFromGallery();
                case PickerSelection.remove:
                  return _removeImage();
              }
            },
          );
        });
  }

  void goToPickImage() {
    _validate();
    if (_errors.isEmpty) {
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void removeImage() {
    _removeImage();
  }

  void editCarData() {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void save() async {
    final useCase = getIt<ISendAboutCarSectionUseCase>();
    _loading.value = true;
    final aboutMeSection = await useCase
        .call(
      SendAboutCarSectionRequest(
        carBrand: carBrand,
        carModel: carModel,
        carPlate: carPlate,
        carImage: _image.value!,
        userUuid: user.uuid,
      ),
    )
        .onError((error, stackTrace) {
      _loading.value = false;
      throw error as Exception;
    }).whenComplete(() => _loading.value = false);

    Get.back();
    Get.find<DomiciliaryRequestCtrl>().updateSection(aboutMeSection);
  }
}
