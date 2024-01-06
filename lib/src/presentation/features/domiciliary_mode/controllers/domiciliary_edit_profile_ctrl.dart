import 'package:motodomi_app/lib.dart';

class DomiciliaryEditProfileCtrl extends GetxController {
  // ---------------------- Local Variables ---------------------

  final DeliveryManProfile deliveryManProfile;
  final AppUser user;

  // ---------------------- Constructor ---------------------

  DomiciliaryEditProfileCtrl({
    required this.deliveryManProfile,
    required this.user,
  });

  // ---------------------- Observables ---------------------

  final RxString _firstName = ''.obs;
  final RxString _lastName = ''.obs;
  final RxString _code = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _email = ''.obs;
  final Rx<String?> _avatar = Rx(null);

  final RxBool _loadingAvatar = false.obs;

  // -------------------- No Observables -------------------
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final codeCtrl = TextEditingController();

  // ---------------------- Getters ---------------------

  String get firstName => _firstName.value;
  String get lastName => _lastName.value;
  String get phone => _phone.value;
  String get code => _code.value;
  String get email => _email.value;
  String? get avatar => _avatar.value;
  bool get loadingAvatar => _loadingAvatar.value;

  // ---------------------- Setters ---------------------

  set firstName(String value) => _firstName.value = value;
  set lastName(String value) => _lastName.value = value;
  set phone(String value) => _phone.value = value;
  set code(String value) => _code.value = value;
  set email(String value) => _email.value = value;

  // ---------------------- Life Cycle ---------------------

  @override
  void onReady() {
    super.onReady();
    _firstName.value = deliveryManProfile.firstName;

    _email.value = deliveryManProfile.email;
    _avatar.value = deliveryManProfile.profileImage;
    _lastName.value = deliveryManProfile.lastName;
    _phone.value = deliveryManProfile.phone;
    _code.value = deliveryManProfile.code;

    firstNameCtrl.text = _firstName.value;
    lastNameCtrl.text = _lastName.value;
    emailCtrl.text = _email.value;
    phoneCtrl.text = _phone.value;
    codeCtrl.text = _code.value;
  }
  // ---------------------- Private Methods ---------------------

  void _pickImageFromCamera() async {
    final useCase = getIt<IUpdateDeliveryManProfileAvatarFromCameraUseCase>();
    _loadingAvatar.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final url = await useCase.updateDeliveryManProfileAvatarFromCamera(
      UpdateDeliveryManProfileAvatarFromCameraRequest(
        deliveryManProfile: deliveryManProfile,
      ),
    );
    _loadingAvatar.value = false;
    _avatar.value = url;
    Get.find<DomiciliaryHomeCtrl>().updateProfileImage(url);
  }

  void _pickImageFromGallery() async {
    final useCase = getIt<IUpdateDeliveryManProfileAvatarFromGalleryUseCase>();
    _loadingAvatar.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final url = await useCase.updateDeliveryManProfileAvatarFromGallery(
        UpdateDeliveryManProfileAvatarFromGalleryRequest(
      deliveryManProfile: deliveryManProfile,
    ));
    _loadingAvatar.value = false;
    _avatar.value = url;
    Get.find<DomiciliaryHomeCtrl>().updateProfileImage(url);
  }

  void _removeImage() async {
    final useCase = getIt<IDeleteDeliveryManProfileAvatarUseCase>();
    _loadingAvatar.value = true;
    await Future.delayed(const Duration(seconds: 1));
    await useCase
        .deleteDeliveryManProfileAvatar(DeleteDeliveryManProfileAvatarRequest(
      deliveryManProfile: deliveryManProfile,
    ));
    _loadingAvatar.value = false;
    _avatar.value = null;
    Get.find<DomiciliaryHomeCtrl>().updateProfileImage(null);
  }

  // ---------------------- Public Methods ---------------------

  void saveProfileData() async {
    final useCase = getIt<IUpdateDeliveryManProfileUseCase>();
    final deliveryManProfile =
        await useCase.updateDeliveryManProfile(UpdateDeliveryManProfileRequest(
      user: user,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      code: code,
      avatar: avatar,
    ));
    Get.find<DomiciliaryHomeCtrl>().updateProfile(deliveryManProfile);
    Get.find<BannerCtrl>().showSuccess(
      'Perfil actualizado correctamente',
      'Tu perfil ha sido actualizado correctamente',
    );
  }

  void pickImage() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (context) {
          return PickerSelectionModal(
            canRemove: avatar != null,
            onSelect: (selection) {
              switch (selection) {
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
}
