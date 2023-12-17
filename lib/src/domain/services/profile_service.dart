import 'package:motodomi_app/lib.dart';

abstract class IProfileLocationService {
  Future<void> updateProfileLocationData(
    AppUser user, {
    required double latitude,
    required double longitude,
  });
}

abstract interface class IProfileAvatarService {
  Future<String?> updateProfileAvatarDataFromGallery(AppUser user);

  Future<String?> updateProfileAvatarDataFromCamera(AppUser user);

  Future<void> deleteProfileAvatarData(AppUser user);
}
