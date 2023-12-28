import 'package:motodomi_app/lib.dart';

abstract class DeviceRoutes {
  static const String dniScan = "/dni-scan";

  static final List<GetPage> routes = [
    GetPage(
      name: dniScan,
      page: () => ScanDNICameraPage(
        title: Get.arguments["title"] as String,
      ),
    ),
  ];
}
