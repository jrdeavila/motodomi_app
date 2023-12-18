import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IPickImage)
class CroppPickImageUtility implements IPickImage {
  @override
  Future<Uint8List?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    final path = image?.path;
    if (path == null) return null;
    return _croppImage(path);
  }

  @override
  Future<Uint8List?> takePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    final path = image?.path;
    if (path == null) return null;
    return _croppImage(path);
  }

  Future<Uint8List?> _croppImage(String path) async {
    final croppedImage =
        await ImageCropper().cropImage(sourcePath: path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
    ], uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Configuración de imagen',
        toolbarColor: Get.context!.theme.colorScheme.secondary,
        backgroundColor: Get.context!.theme.colorScheme.primary,
        cropFrameColor: Get.context!.theme.colorScheme.secondary,
        cropGridColor: Get.context!.theme.colorScheme.secondary,
        statusBarColor: Get.context!.theme.colorScheme.secondary,
        activeControlsWidgetColor: Get.context!.theme.colorScheme.secondary,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      )
    ]);
    return croppedImage?.readAsBytes();
  }
}
