import 'package:motodomi_app/lib.dart';

class EditProfileCtrl extends GetxController {
  // ---------------------- Observables ---------------------

  final RxString _name = ''.obs;
  final RxString _code = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _email = ''.obs;
  final Rx<String?> _avatar = null.obs;
  final RxString _currentPassword = ''.obs;
  final RxString _password = ''.obs;
  final RxString _confirmPassword = ''.obs;

  // ---------------------- Getters ---------------------

  String get name => _name.value;
  String get phone => _phone.value;
  String get code => _code.value;
  String get email => _email.value;
  String? get avatar => _avatar.value;
  String get currentPassword => _password.value;
  String get password => _password.value;
  String get confirmPassword => _confirmPassword.value;

  // ---------------------- Setters ---------------------

  set name(String value) => _name.value = value;
  set phone(String value) => _phone.value = value;
  set code(String value) => _code.value = value;
  set email(String value) => _email.value = value;
  set currentPassword(String value) => _currentPassword.value = value;
  set password(String value) => _password.value = value;
  set confirmPassword(String value) => _confirmPassword.value = value;

  // ---------------------- Life Cycle ---------------------

  @override
  void onReady() {
    super.onReady();
    _name.value = Get.find<SessionCtrl>().user!.name;
    var phone = Get.find<SessionCtrl>().user!.phone;
    // +57 300 123 4567
    _code.value = phone.split(' ')[0];
    _phone.value = phone.split(' ').sublist(1).join(' ');

    _email.value = Get.find<SessionCtrl>().user!.email;
    _avatar.value = Get.find<SessionCtrl>().user!.avatar;
  }

  // ---------------------- Public Methods ---------------------

  void saveProfileData() async {
    final useCase = getIt<IUpdateProfileUseCase>();
    final user = await useCase.updateProfile(UpdateProfileRequest(
      uuid: Get.find<SessionCtrl>().user!.uuid,
      name: name,
      phone: "$code $phone",
      email: email,
    ));
    Get.find<SessionCtrl>().setUser(user);
    Get.find<BannerCtrl>().showSuccess(
      'Perfil actualizado correctamente',
      'Tu perfil ha sido actualizado correctamente',
    );
  }
}
