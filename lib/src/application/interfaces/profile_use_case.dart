import 'package:motodomi_app/lib.dart';

abstract class IUpdateProfileUseCase {
  Future<AppUser> updateProfile(UpdateProfileRequest updateProfileRequest);
}

abstract interface class IUpdateProfileAvatarWithCameraUseCase {
  Future<String?> updateProfileAvatarWithCamera(
      UpdateProfileAvatarRequest updateProfileAvatarRequest);
}

abstract interface class IUpdateProfileAvatarWithGalleryUseCase {
  Future<String?> updateProfileAvatarWithGallery(
      UpdateProfileAvatarRequest updateProfileAvatarRequest);
}

abstract interface class IDeleteProfileAvatarUseCase {
  Future<void> deleteProfileAvatar(
      DeleteProfileAvatarRequest deleteProfileAvatarRequest);
}

abstract interface class IChangePasswordUseCase {
  Future<void> changePassword(ChangePasswordRequest changePasswordRequest);
}
