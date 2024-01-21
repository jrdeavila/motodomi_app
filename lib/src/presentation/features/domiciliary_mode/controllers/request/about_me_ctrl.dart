import 'package:intl/intl.dart';
import 'package:motodomi_app/lib.dart';

class AboutMeCtrl extends GetxController {
  final AboutMeSection aboutMeSection;
  final AppUser user;

  // ------------------------- Constructor -------------------------

  AboutMeCtrl({
    required this.aboutMeSection,
    required this.user,
  });
  // ----------------------- Life Cycle -----------------------

  @override
  void onReady() {
    super.onReady();
    _firstName.value = aboutMeSection.firstName ?? "";
    _lastName.value = aboutMeSection.lastName ?? "";
    _email.value = aboutMeSection.email ?? "";
    _phone.value = aboutMeSection.phone ?? "";
    _code.value = aboutMeSection.code ?? "";
    _birthDate.value = aboutMeSection.birthDate == null
        ? null
        : _formatDate(aboutMeSection.birthDate!);
    if (aboutMeSection.profileImage != null) {
      imageFromNetworkImage(aboutMeSection.profileImage!)
          .then((value) => _image.value = value);
    }

    firstnameCtrl.text = aboutMeSection.firstName ?? "";
    lastnameCtrl.text = aboutMeSection.lastName ?? "";
    emailCtrl.text = aboutMeSection.email ?? "";
    phoneCtrl.text = aboutMeSection.phone ?? "";
    codeCtrl.text = aboutMeSection.code ?? "";

    debounce(_firstName, (_) => _validate());
    debounce(_lastName, (_) => _validate());
    debounce(_email, (_) => _validate());
    debounce(_birthDate, (_) => _validate());
    debounce(_image, (_) => _validate());
    debounce(_phone, (_) => _validate());
    debounce(_birthDate, (_) => _validate());
  }

  // ------------------------- No Observable -------------------------

  final firstnameCtrl = TextEditingController();
  final lastnameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final codeCtrl = TextEditingController();

  // ------------------------- Observables -------------------------

  final RxString _firstName = ''.obs;
  final RxString _lastName = ''.obs;
  final RxString _email = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _code = ''.obs;
  final Rx<DateTime?> _birthDate = Rx<DateTime?>(null);
  final Rx<Uint8List?> _image = Rx<Uint8List?>(null);

  final RxBool _isValid = false.obs;
  final RxMap<String, String> _errors = RxMap<String, String>();
  final RxBool _loading = false.obs;

  // ------------------------- Getters ---------------------------

  String get firstName => _firstName.value;
  String get lastName => _lastName.value;
  String get email => _email.value;
  DateTime get birthDate => _birthDate.value ?? DateTime.now();
  String get phone => _phone.value;
  String get code => _code.value;
  Uint8List? get image => _image.value;

  bool get isValid => _isValid.value;
  Map<String, String> get errors => _errors;
  bool get loading => _loading.value;

  // ------------------------- Setters ---------------------------

  set firstName(String value) => _firstName.value = value;
  set lastName(String value) => _lastName.value = value;
  set email(String value) => _email.value = value;
  set birthDate(DateTime value) => _birthDate.value = value;
  set phone(String value) => _phone.value = value;
  set code(String value) => _code.value = value;

  // ------------------------- Private Methods -------------------------

  DateTime _formatDate(String date) {
    final dateParts = date.split('-');
    return DateTime(
      int.parse(dateParts[0]),
      int.parse(dateParts[1]),
      int.parse(dateParts[2]),
    );
  }

  String _dateToString(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void _validate() {
    _errors.clear();

    if (_firstName.value.isEmpty) {
      _errors['firstName'] = 'El nombre es requerido';
    }
    if (_lastName.value.isEmpty) {
      _errors['lastName'] = 'El apellido es requerido';
    }
    if (_email.value.isEmpty) {
      _errors['email'] = 'El correo es requerido';
    }
    if (_birthDate.value == null) {
      _errors['birthDate'] = 'La fecha de nacimiento es requerida';
    }
    if (_image.value == null) {
      _errors['image'] = 'La foto de perfil es requerida';
    }
    if (_phone.value.isEmpty) {
      _errors['phone'] = 'El teléfono es requerido';
    }
    if (_code.value.isEmpty) {
      _errors['code'] = 'El código es requerido';
    }
    if (_email.value.isNotEmpty && !_email.value.isEmail) {
      _errors['email'] = 'El correo no es válido';
    }
    if (_birthDate.value != null && _birthDate.value!.isAfter(DateTime.now())) {
      _errors['birthDate'] =
          'La fecha de nacimiento no puede ser mayor a la fecha actual';
    }
    if (_birthDate.value != null &&
        _birthDate.value!
            .isAfter(DateTime.now().subtract(const Duration(days: 6570)))) {
      _errors['birthDate'] = 'Debes ser mayor de edad';
    }
    if (_phone.value.isNotEmpty && _phone.value.length < 10) {
      _errors['phone'] = 'El teléfono no es válido';
    }

    _isValid.value = _errors.isEmpty;
  }

  void _pickImageFromCamera() {
    final service = getIt<IPickImage>();
    service.takePhoto().then((value) {
      _image.value = value;
    });
  }

  void _pickImageFromGallery() {
    final service = getIt<IPickImage>();
    service.pickImage().then((value) => _image.value = value);
  }

  void _removeImage() {
    _image.value = null;
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

  void save() async {
    final useCase = getIt<ISendAboutMeSectionUseCase>();
    _loading.value = true;
    final aboutMeSection = await useCase
        .call(
      SendAboutMeSectionRequest(
        userUuid: user.uuid,
        firstname: firstName,
        lastname: lastName,
        email: email,
        phone: phone,
        code: code,
        birthDate: _dateToString(birthDate),
        profileImage: _image.value!,
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
