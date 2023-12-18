import 'package:motodomi_app/lib.dart';

abstract class DomiciliaryRoutes {
  static const String domiciliaryRequest = '/domiciliary-request';
  static const String domiciliaryLoading = '/domiciliary-loading';
  static const String domiciliaryMode = '/domiciliary-mode';

  static final routes = [
    GetPage(
        name: domiciliaryRequest,
        page: () => const DomiciliaryRequestFormPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
            () => DomiciliaryRequestCtrl(),
          );
        })),
    GetPage(
      name: domiciliaryLoading,
      page: () => const DomiciliaryLoadingPage(),
    ),
    GetPage(
      name: domiciliaryMode,
      page: () => const DomiciliaryLoadingPage(),
    ),
    ...DomiciliaryRequestRoutes.routes,
  ];
}
