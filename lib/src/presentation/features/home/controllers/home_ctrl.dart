import 'package:motodomi_app/lib.dart';

class DrawerOption {
  final String title;
  final String? desc;
  final IconData icon;
  final void Function(BuildContext context)? onTap;

  DrawerOption({
    required this.title,
    this.desc,
    required this.icon,
    this.onTap,
  });
}

class HomeCtrl extends GetxController {
  // ---------------------- Getters ---------------------

  List<DrawerOption> get options => [
        DrawerOption(
          title: "Principal",
          icon: FontAwesomeIcons.houseChimneyCrack,
        ),
        DrawerOption(
          title: "Configuracion del usuario",
          icon: FontAwesomeIcons.userGroup,
        ),
        DrawerOption(
          title: "Modo de conductor",
          icon: FontAwesomeIcons.carBurst,
        ),
      ];

  // ---------------------- Public Methods ---------------------

  void logout() {
    Get.find<SessionCtrl>().logout();
  }
}
