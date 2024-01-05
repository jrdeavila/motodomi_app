import 'package:motodomi_app/lib.dart';

class DomiciliaryHomeCtrl extends GetxController {
  // ---------------------- Getters ---------------------
  List<HomeOption> get homeOptions => [
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
          title: "Editar Perfil",
          icon: FontAwesomeIcons.userGear,
          onTap: (context) {
            Get.toNamed(HomeRoutes.editProfile);
          },
        ),
        HomeOption(
          title: "Preferencias de modo de domiciliario",
          icon: FontAwesomeIcons.motorcycle,
          onTap: (context) {
            // Get.toNamed(HomeRoutes.editProfile);
          },
        ),
      ];

  String get userFirstName => Get.find<SessionCtrl>().user!.name.split(' ')[0];

  String get userName => Get.find<SessionCtrl>().user!.name;

  String get userPhone => Get.find<SessionCtrl>().user!.phone;

  String? get userAvatar => Get.find<SessionCtrl>().user!.avatar;

  // ---------------------- Public Methods ---------------------

  void logout() {
    Get.find<SessionCtrl>().logout();
  }
}
