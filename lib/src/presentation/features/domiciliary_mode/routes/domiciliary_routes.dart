import 'package:motodomi_app/lib.dart';

abstract class DomiciliaryRoutes {
  static const String domiciliaryRequest = '/domiciliary-request';
  static const String domiciliaryLoading = '/domiciliary-loading';
  static const String domiciliaryMode = '/domiciliary-mode';
  static const String domiciliaryHome = '/domiciliary-home';
  static const String domiciliaryRequestSended = '/domiciliary-request-sended';
  static const String domiciliaryRequestRejected =
      '/domiciliary-request-rejected';
  static const String domiciliaryRequestApproved =
      '/domiciliary-request-approved';
  static const String domiciliaryRequestComplete =
      '/domiciliary-request-complete';

  static final routes = [
    GetPage(
      name: domiciliaryHome,
      page: () => const DomiciliaryHomePage(),
    ),
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
    GetPage(
      name: domiciliaryRequestSended,
      page: () => const DomiciliaryRequestSendedPage(),
    ),
    GetPage(
      name: domiciliaryRequestApproved,
      page: () => const DomiciliaryRequestApprovedPage(),
    ),
    GetPage(
      name: domiciliaryRequestRejected,
      page: () => const DomiciliaryRequestRejectedPage(),
    ),
    GetPage(
      name: domiciliaryRequestComplete,
      page: () => const DomiciliaryRequestCompletePage(),
    ),
    ...DomiciliaryRequestRoutes.routes,
  ];
}
