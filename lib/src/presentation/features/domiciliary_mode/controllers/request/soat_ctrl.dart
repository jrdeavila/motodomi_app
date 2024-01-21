import 'dart:io';

import 'package:motodomi_app/lib.dart';

class SoatCtrl extends GetxController {
  // ------------------- Variables -------------------

  final SoatSection soatSection;
  final AppUser user;

  // ------------------- Constructor -------------------
  SoatCtrl({
    required this.soatSection,
    required this.user,
  });
  // ------------------- No Observable -------------------

  final pageController = PageController(initialPage: 0);

  // ------------------- Observables -------------------

  final Rx<String?> _soatUploadedUrl = Rx<String?>(null);
  final Rx<File?> _soatFile = Rx<File?>(null);
  final RxBool _loading = RxBool(false);

  // ------------------- Getters -------------------

  String? get soatUploadedUrl => _soatUploadedUrl.value;
  File? get soatFile => _soatFile.value;

  bool get loading => _loading.value;

  bool get canSave => soatFile != null;

  bool get canEdit => soatUploadedUrl != null;

  // ------------------- Life Cycle -------------------

  @override
  void onReady() {
    super.onReady();
    ever(
      _soatFile,
      _goToViewSoatMemory,
    );
    ever(
      _soatUploadedUrl,
      _goToViewSoatNetwork,
      condition: (_) => _soatUploadedUrl.value != null,
    );
    if (soatSection.soatFile != null) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        _soatUploadedUrl.value = soatSection.soatFile;
      });
    }
  }
  // ------------------- Events -------------------

  void _goToViewSoatNetwork(String? soatUrl) {
    if (soatUrl != null) {
      pageController.animateToPage(2,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      pageController.animateToPage(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _goToViewSoatMemory(File? soatFile) {
    _soatUploadedUrl.value = null;
    if (soatFile != null) {
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
    ]).then((value) => _soatFile.value = value);
  }

  void save() async {
    _loading.value = true;
    final useCase = getIt<ISendSoatSectionUseCase>();
    final section = await useCase
        .call(
      SendSoatSectionRequest(
        soatFile: soatFile!,
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
