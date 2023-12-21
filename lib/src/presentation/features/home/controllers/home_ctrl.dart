import 'package:motodomi_app/lib.dart';

class HomeOption {
  final String title;
  final String? desc;
  final IconData icon;
  final void Function(BuildContext context)? onTap;

  HomeOption({
    required this.title,
    this.desc,
    required this.icon,
    this.onTap,
  });
}

class HomeCtrl extends GetxController {
  // ---------------------- Getters ---------------------
  List<HomeOption> get homeOptions => [
        HomeOption(
          title: "Principal",
          icon: FontAwesomeIcons.houseChimneyCrack,
          onTap: (context) {
            if (Get.currentRoute != HomeRoutes.home) {
              Get.offAllNamed(HomeRoutes.home);
            }
          },
        ),
        HomeOption(
          title: "Perfil",
          icon: FontAwesomeIcons.userGroup,
          onTap: (context) => Get.toNamed(HomeRoutes.profileDetails),
        ),
        HomeOption(
          title: "Modo de conductor",
          icon: FontAwesomeIcons.carBurst,
          onTap: (context) {
            Get.find<DomiciliaryModeCtrl>().goToDomiciliaryMode();
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
