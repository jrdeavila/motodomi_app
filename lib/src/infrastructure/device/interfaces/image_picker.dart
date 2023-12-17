import 'package:motodomi_app/lib.dart';

abstract class IPickImage {
  Future<Uint8List?> pickImage();
  Future<Uint8List?> takePhoto();
}
