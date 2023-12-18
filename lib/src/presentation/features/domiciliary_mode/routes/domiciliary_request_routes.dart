import 'package:motodomi_app/lib.dart';

abstract class DomiciliaryRequestRoutes {
  static const String aboutMe = '/about-me';
  static const String dni = '/dni';
  static const String license = '/license';
  static const String soat = '/soat';
  static const String technicalReview = '/technical-review';
  static const String onwerShip = '/owner-ship';
  static const String aboutCar = '/about-car';
  static const String noCriminalRecord = '/no-criminal-record';

  static final routes = [
    GetPage(
        name: aboutMe,
        page: () => const AboutMePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<AboutMeCtrl>(
            () => AboutMeCtrl(
              aboutMeSection: Get.arguments['section'],
              user: Get.arguments['user'],
            ),
          );
        })),
    GetPage(
      name: dni,
      page: () => const DNIPage(),
    ),
    GetPage(
      name: license,
      page: () => const DriverLicensePage(),
    ),
    GetPage(
      name: soat,
      page: () => const SoatPage(),
    ),
    GetPage(
      name: technicalReview,
      page: () => const TechnicalReviewPage(),
    ),
    GetPage(
      name: onwerShip,
      page: () => const OwnerShipCardPage(),
    ),
    GetPage(
      name: aboutCar,
      page: () => const AboutCarPage(),
    ),
    GetPage(
      name: noCriminalRecord,
      page: () => const NoCriminalRecordPage(),
    ),
  ];
}
