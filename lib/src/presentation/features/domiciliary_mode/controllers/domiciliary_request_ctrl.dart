import 'dart:ui';

import 'package:motodomi_app/lib.dart';

enum StepStatus {
  making,
  complete,
  rejected,
}

StepStatus stepStatusFromSectionStatus(SectionStatus status) {
  switch (status) {
    case SectionStatus.complete:
      return StepStatus.complete;
    case SectionStatus.approved:
      return StepStatus.complete;
    case SectionStatus.rejected:
      return StepStatus.rejected;
    default:
      return StepStatus.making;
  }
}

class SectionSegment {
  final String title;
  final String? description;
  StepStatus status;
  final VoidCallback onTap;
  final IconData icon;

  SectionSegment({
    required this.title,
    this.description,
    required this.onTap,
    required this.status,
    required this.icon,
  });
}

final redirectBySectionClass = {
  AboutMeSection: DomiciliaryRequestRoutes.aboutMe,
  DNISection: DomiciliaryRequestRoutes.dni,
  DriverLicenseSection: DomiciliaryRequestRoutes.license,
  SoatSection: DomiciliaryRequestRoutes.soat,
  TechnicalReviewSection: DomiciliaryRequestRoutes.technicalReview,
  OwnerShipCardSection: DomiciliaryRequestRoutes.onwerShip,
  AboutCarSection: DomiciliaryRequestRoutes.aboutCar,
  NoCriminalRecordSection: DomiciliaryRequestRoutes.noCriminalRecord,
};

final iconBySectionClass = {
  AboutMeSection: FontAwesomeIcons.user,
  DNISection: FontAwesomeIcons.idCard,
  DriverLicenseSection: FontAwesomeIcons.carSide,
  SoatSection: FontAwesomeIcons.carBurst,
  TechnicalReviewSection: FontAwesomeIcons.paperPlane,
  OwnerShipCardSection: FontAwesomeIcons.carRear,
  AboutCarSection: FontAwesomeIcons.car,
  NoCriminalRecordSection: FontAwesomeIcons.fileContract,
};

class DomiciliaryRequestCtrl extends GetxController {
  // ------------------- Properties ------------------

  final backgroundMaxSize = (Get.height * 0.2);
  final ScrollController scrollController = ScrollController();

  // ------------------- Observables ------------------

  late final RxDouble _backgroundOffset = RxDouble(backgroundMaxSize);
  final Rx<DriverRequest> _driverRequest =
      Rx<DriverRequest>(DriverRequest.empty());
  final RxBool _loading = RxBool(false);

  // ------------------- Getters ------------------

  List<SectionSegment> get steps => [
        _driverRequest.value.aboutMeSection,
        _driverRequest.value.dniSection,
        _driverRequest.value.driverLicenseSection,
        _driverRequest.value.soatSection,
        _driverRequest.value.technicalReviewSection,
        _driverRequest.value.ownerShipCardSection,
        _driverRequest.value.aboutCarSection,
        _driverRequest.value.noCriminalRecordSection,
      ]
          .map((e) => SectionSegment(
                icon: iconBySectionClass[e.runtimeType]!,
                title: e.title,
                description: e.description,
                status: stepStatusFromSectionStatus(e.status),
                onTap: () => Get.toNamed(redirectBySectionClass[e.runtimeType]!,
                    arguments: {
                      'user': Get.find<SessionCtrl>().user,
                      'section': e,
                    }),
              ))
          .toList();

  double get backgroundOffset => _backgroundOffset.value;

  bool get loading => _loading.value;

  // ------------------ Lifecycle ------------------

  @override
  void onReady() {
    super.onReady();

    _listenScrollController();
    _fetchDriverRequest();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // ------------------- Private Methods ------------------
  void _listenScrollController() {
    scrollController.addListener(() {
      _backgroundOffset.value = lerpDouble(
        backgroundMaxSize,
        0.0,
        scrollController.offset / backgroundMaxSize,
      )!;
    });
  }

  void _fetchDriverRequest() async {
    final user = Get.find<SessionCtrl>().user;
    final useCase = getIt<IFetchDriverRequestUseCase>();
    _loading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final driverRequest = await useCase.call(FetchDriverRequestRequest(user!));
    _driverRequest.value = driverRequest;
    _loading.value = false;
  }

  // ------------------- Public Methods ------------------

  void updateSection(DriverRequestSection section) {
    switch (section.runtimeType) {
      case AboutMeSection:
        _driverRequest.value.aboutMeSection = section as AboutMeSection;
        break;
      case DNISection:
        _driverRequest.value.dniSection = section as DNISection;
        break;
      case DriverLicenseSection:
        _driverRequest.value.driverLicenseSection =
            section as DriverLicenseSection;
        break;
      case SoatSection:
        _driverRequest.value.soatSection = section as SoatSection;
        break;
      case TechnicalReviewSection:
        _driverRequest.value.technicalReviewSection =
            section as TechnicalReviewSection;
        break;
      case OwnerShipCardSection:
        _driverRequest.value.ownerShipCardSection =
            section as OwnerShipCardSection;
        break;
      case AboutCarSection:
        _driverRequest.value.aboutCarSection = section as AboutCarSection;
        break;
      case NoCriminalRecordSection:
        _driverRequest.value.noCriminalRecordSection =
            section as NoCriminalRecordSection;
        break;
    }
  }

  // ------------------- Public Methods ------------------
}
