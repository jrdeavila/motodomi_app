import 'dart:io';

import 'package:motodomi_app/lib.dart';

class NoCriminalRecordCtrl extends GetxController {
  // ------------------- Variables -------------------

  final NoCriminalRecordSection noCriminalRecordSection;
  final AppUser user;

  // ------------------- Constructor -------------------
  NoCriminalRecordCtrl({
    required this.noCriminalRecordSection,
    required this.user,
  });
  // ------------------- No Observable -------------------

  final pageController = PageController(initialPage: 0);

  // ------------------- Observables -------------------

  final Rx<String?> _ncmUploadedUrl = Rx<String?>(null);
  final Rx<File?> _ncmFile = Rx<File?>(null);
  final RxBool _loading = RxBool(false);

  // ------------------- Getters -------------------

  String? get ncmUploadedUrl => _ncmUploadedUrl.value;
  File? get ncmFile => _ncmFile.value;

  bool get loading => _loading.value;

  bool get canSave => ncmFile != null;

  bool get canEdit => ncmUploadedUrl != null;

  // ------------------- Life Cycle -------------------

  @override
  void onReady() {
    super.onReady();
    ever(
      _ncmFile,
      _goToViewNcmMemory,
    );
    ever(
      _ncmUploadedUrl,
      _goToViewNcmNetwork,
      condition: (_) => _ncmUploadedUrl.value != null,
    );
    if (noCriminalRecordSection.noCriminalRecordFile != null) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        _ncmUploadedUrl.value = noCriminalRecordSection.noCriminalRecordFile;
      });
    }
  }
  // ------------------- Events -------------------

  void _goToViewNcmNetwork(String? soatUrl) {
    if (soatUrl != null) {
      pageController.animateToPage(2,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      pageController.animateToPage(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _goToViewNcmMemory(File? soatFile) {
    _ncmUploadedUrl.value = null;
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
    ]).then((value) => _ncmFile.value = value);
  }

  void save() async {
    _loading.value = true;
    final useCase = getIt<ISendNoCriminalRecordSectionUseCase>();
    final section = await useCase
        .call(
      SendNoCriminalRecordSectionRequest(
        criminalRecord: ncmFile!,
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
