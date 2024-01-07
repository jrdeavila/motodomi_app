import 'package:motodomi_app/lib.dart';

class DomiciliaryHomeCtrl extends GetxController {
  // ---------------------- Local Variables ---------------------
  final AppUser user;

  // ---------------------- Constructor ---------------------

  DomiciliaryHomeCtrl({required this.user});
  // ---------------------- Observable ---------------------

  final Rx<DeliveryManProfile?> _deliveryManProfile =
      Rx<DeliveryManProfile?>(null);

  // ---------------------- Getters ---------------------

  List<HomeSection> get homeSections => [
        HomeSection(
          title: "Bienvenido $userFirstName",
          child: const DomiciliaryWelcomeMessage(),
        ),
        HomeSection(
          title: "Opciones como conductor",
          child: const DeliveryManOptions(),
        ),
        HomeSection(
          title: "Recargar saldo",
          child: RechargeBalanceButton(onTap: () {}),
        ),
        HomeSection(
          title: "Gestionar documentos",
          child: ManageDocumentsButton(onTap: () {}),
        ),
      ];

  List<HomeOption> get deliveryManOptions => [
        HomeOption(
            title: "Servicios",
            icon: FontAwesomeIcons.motorcycle,
            onTap: (context) {}),
        HomeOption(
          title: "Preferencias",
          icon: FontAwesomeIcons.userGear,
          onTap: (context) {},
        ),
        HomeOption(
          title: "Modo cliente",
          icon: FontAwesomeIcons.solidUser,
          onTap: (context) {},
        ),
        HomeOption(
          title: "Perfil",
          icon: FontAwesomeIcons.solidCircleUser,
          onTap: (context) {
            Get.toNamed(DomiciliaryRoutes.profileDetails);
          },
        ),
      ];

  List<HomeOption> get homeDrawerOptions => [
        HomeOption(
          title: "Principal",
          icon: FontAwesomeIcons.houseChimneyCrack,
          onTap: (context) {
            if (Get.currentRoute != HomeRoutes.home) {
              Get.offAllNamed(DomiciliaryRoutes.domiciliaryHome);
            }
          },
        ),
        HomeOption(
          title: "Perfil",
          icon: FontAwesomeIcons.userGroup,
          onTap: (context) => Get.toNamed(DomiciliaryRoutes.profileDetails),
        ),
        HomeOption(
          title: "Modo de cliente",
          icon: FontAwesomeIcons.solidUser,
          onTap: (context) {
            Get.find<DomiciliaryModeCtrl>().goToClientMode();
          },
        ),
        HomeOption(
          title: "Configuraciones",
          icon: FontAwesomeIcons.gear,
        ),
      ];

  List<HomeOption> get profileOptions => [
        HomeOption(
          title: "Editar perfil de domiciliario",
          icon: FontAwesomeIcons.userGear,
          onTap: (context) {
            Get.toNamed(DomiciliaryRoutes.domiciliaryEditProfile);
          },
        ),
        HomeOption(
          title: "Preferencias de uso",
          icon: FontAwesomeIcons.motorcycle,
          onTap: (context) {
            // Get.toNamed(HomeRoutes.editProfile);
          },
        ),
        HomeOption(
          title: "Editar datos de solicitud",
          icon: FontAwesomeIcons.fileSignature,
          onTap: (context) {
            // Get.toNamed(HomeRoutes.editProfile);
          },
        ),
      ];

  String get userFirstName =>
      _deliveryManProfile.value?.firstName ?? user.name.split(" ")[0];

  String get userName => _deliveryManProfile.value != null
      ? "${_deliveryManProfile.value!.firstName} ${_deliveryManProfile.value!.lastName}"
      : user.name;

  String get userPhone => _deliveryManProfile.value != null
      ? "${_deliveryManProfile.value!.code} ${_deliveryManProfile.value!.phone}"
      : user.phone;

  String? get userAvatar =>
      _deliveryManProfile.value?.profileImage ?? user.avatar;

  DeliveryManProfile? get deliveryManProfile => _deliveryManProfile.value;

  // ----------------------- Life Cycle ---------------------

  @override
  void onReady() {
    super.onReady();

    _getDeliveryManProfile();
  }

  // ----------------------- Private Methods ---------------------

  void _getDeliveryManProfile() async {
    final deliveryManProfile = await getIt<IGetDeliveryManProfileUseCase>()
        .getDeliveryManProfile(user);
    _deliveryManProfile.value = deliveryManProfile;
  }

  // ---------------------- Public Methods ---------------------

  void logout() {
    Get.find<SessionCtrl>().logout();
  }

  void updateProfile(DeliveryManProfile deliveryManProfile) {
    _deliveryManProfile.value = deliveryManProfile;
    _deliveryManProfile.refresh();
  }

  void updateProfileImage(String? profileImageURL) {
    if (profileImageURL == null) return;
    _deliveryManProfile.value?.profileImage = profileImageURL;
    _deliveryManProfile.refresh();
  }
}
