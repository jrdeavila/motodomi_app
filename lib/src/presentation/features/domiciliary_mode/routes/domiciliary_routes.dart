import 'package:motodomi_app/lib.dart';

abstract class DomiciliaryRoutes {
  static const String domiciliaryRequest = '/domiciliary-request';
  static const String domiciliaryLoading = '/domiciliary-loading';
  static const String domiciliaryMode = '/domiciliary-mode';
  static const String domiciliaryHome = '/domiciliary-home';
  static const String profileDetails = '/domiciliary-profile-details';
  static const String domiciliaryEditProfile = '/domiciliary-edit-profile';
  static const String domiciliaryViewBalance = '/domiciliary-view-balance';
  static const String domiciliaryRechargeBalance =
      '/domiciliary-recharge-balance';
  static const String domiciliaryTermsAndConditions =
      "/payment-terms-and-conditions";

  static const String domiciliaryRequestSended = '/domiciliary-request-sended';
  static const String domiciliaryRequestRejected =
      '/domiciliary-request-rejected';
  static const String domiciliaryRequestApproved =
      '/domiciliary-request-approved';
  static const String domiciliaryRequestComplete =
      '/domiciliary-request-complete';
  static const String domiciliaryHistoryPayment =
      '/domiciliary-history-payment';

  static final routes = [
    GetPage(
      name: domiciliaryHome,
      page: () => const DomiciliaryHomePage(),
      binding: BindingsBuilder(() {
        Get.put(
          DomiciliaryHomeCtrl(
            user: Get.find<SessionCtrl>().user!,
          ),
        );
      }),
    ),
    GetPage(
      name: domiciliaryEditProfile,
      page: () => const DomiciliaryEditProfilePage(),
      binding: BindingsBuilder(() {
        Get.put(
          DomiciliaryEditProfileCtrl(
            user: Get.find<SessionCtrl>().user!,
            deliveryManProfile:
                Get.find<DomiciliaryHomeCtrl>().deliveryManProfile!,
          ),
        );
      }),
    ),
    GetPage(
      name: profileDetails,
      page: () => const DomiciliaryProfileDetailsPage(),
      binding: BindingsBuilder(() {
        Get.put(DomiciliaryHomeCtrl(
          user: Get.find<SessionCtrl>().user!,
        ));
      }),
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
    GetPage(
      name: domiciliaryViewBalance,
      page: () => const DomiciliaryViewBalancePage(),
      binding: BindingsBuilder(() {
        Get.put(
          DomiciliaryRechargeBalanceCtrl(
            deliveryManProfile:
                Get.find<DomiciliaryHomeCtrl>().deliveryManProfile!,
          ),
        );
      }),
    ),
    GetPage(
      name: domiciliaryRechargeBalance,
      page: () => const DomiciliaryRechargeBalancePage(),
      binding: BindingsBuilder(() {
        Get.put(
          DomiciliaryRechargeBalanceCtrl(
            deliveryManProfile:
                Get.find<DomiciliaryHomeCtrl>().deliveryManProfile!,
          ),
        );
      }),
    ),
    GetPage(
      name: domiciliaryTermsAndConditions,
      page: () => DomiciliaryTermsAndConditionsPage(
        url: Get.arguments['url'] as String,
      ),
    ),
    GetPage(
      name: domiciliaryHistoryPayment,
      page: () => const DomiciliaryHistoryPaymentPage(),
      binding: BindingsBuilder(() {
        Get.put(
          HistoryPaymentCtrl(
            deliveryManProfile:
                Get.find<DomiciliaryHomeCtrl>().deliveryManProfile!,
          ),
        );
      }),
    ),
    ...DomiciliaryRequestRoutes.routes,
  ];
}
