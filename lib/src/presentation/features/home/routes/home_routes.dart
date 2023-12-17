import 'package:motodomi_app/lib.dart';

abstract class HomeRoutes {
  static const String home = '/home';
  static const String profileDetails = '/profile-details';
  static const String editProfile = '/edit-profile';
  static const String changePassword = '/change-password';

  static final routes = [
    GetPage(
        name: home,
        page: () => const HomePage(),
        binding: BindingsBuilder(() {
          Get.put(HomeCtrl());
        })),
    GetPage(
        name: profileDetails,
        page: () => const ProfileDetailsPage(),
        binding: BindingsBuilder(() {
          Get.put(HomeCtrl());
        })),
    GetPage(
        name: editProfile,
        page: () => const EditProfilePage(),
        binding: BindingsBuilder(() {
          Get.put(EditProfileCtrl());
        })),
    GetPage(
        name: changePassword,
        page: () => const ChangePasswordPage(),
        binding: BindingsBuilder(() {
          Get.put(EditProfileCtrl());
        })),
  ];
}
