import 'dart:io';

import 'package:motodomi_app/lib.dart';

class TechnicalReviewCtrl extends GetxController {
  // ------------------- Variables -------------------

  final TechnicalReviewSection technicalReviewSection;
  final AppUser user;

  // ------------------- Constructor -------------------
  TechnicalReviewCtrl({
    required this.technicalReviewSection,
    required this.user,
  });
  // ------------------- No Observable -------------------

  final pageController = PageController(initialPage: 0);

  // ------------------- Observables -------------------

  final Rx<String?> _technicalReviewUploadedUrl = Rx<String?>(null);
  final Rx<File?> _technicalReviewFile = Rx<File?>(null);
  final RxBool _loading = RxBool(false);

  // ------------------- Getters -------------------

  String? get technicalReviewUploadedUrl => _technicalReviewUploadedUrl.value;
  File? get technicalReviewFile => _technicalReviewFile.value;

  bool get loading => _loading.value;

  bool get canSave => technicalReviewFile != null;

  bool get canEdit => technicalReviewUploadedUrl != null;

  // ------------------- Life Cycle -------------------

  @override
  void onReady() {
    super.onReady();
    ever(
      _technicalReviewFile,
      _goToViewSoatMemory,
    );
    ever(
      _technicalReviewUploadedUrl,
      _goToViewSoatNetwork,
      condition: (_) => _technicalReviewUploadedUrl.value != null,
    );
    if (technicalReviewSection.technicalReviewUrl != null) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        _technicalReviewUploadedUrl.value =
            technicalReviewSection.technicalReviewUrl;
      });
    }
  }
  // ------------------- Events -------------------

  void _goToViewSoatNetwork(String? technicalReviewUrl) {
    if (technicalReviewUrl != null) {
      pageController.animateToPage(2,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      pageController.animateToPage(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _goToViewSoatMemory(File? technicalReviewFile) {
    _technicalReviewUploadedUrl.value = null;
    if (technicalReviewFile != null) {
      pageController.animateToPage(1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      pageController.animateToPage(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }
  // ------------------- Functions -------------------

  void pickFile() {
    final pickFileService = getIt<IFileSearchService>();
    pickFileService.findFile(allowedExtensions: [
      'pdf',
    ]).then((value) => _technicalReviewFile.value = value);
  }

  void save() async {
    _loading.value = true;
    final useCase = getIt<ISendTechnicalReviewSectionUseCase>();
    final section = await useCase
        .call(
      SendTechnicalReviewSectionRequest(
        technicalReviewFile: technicalReviewFile!,
        userUuid: user.uuid,
      ),
    )
        .onError((error, stackTrace) {
      _loading.value = false;
      throw error as Exception;
    }).whenComplete(() => _loading.value = false);
    Get.back();
    Get.find<DomiciliaryRequestCtrl>().updateSection(section);
  }
}
