import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IUpdateProfileUseCase)
class UpdateProfileUseCase implements IUpdateProfileUseCase {
  final IUserRepository _userRepository;

  UpdateProfileUseCase({required IUserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<AppUser> updateProfile(UpdateProfileRequest updateProfileRequest) {
    final user = AppUser(
      uuid: updateProfileRequest.uuid,
      name: updateProfileRequest.name,
      phone: updateProfileRequest.phone,
      email: updateProfileRequest.email,
      roles: [],
    );

    return _userRepository.updateUser(user);
  }
}

@Injectable(as: IUpdateProfileAvatarWithCameraUseCase)
class UpdateProfileAvatarWithCameraUseCase
    implements IUpdateProfileAvatarWithCameraUseCase {
  final IProfileAvatarService _profileAvatarService;

  UpdateProfileAvatarWithCameraUseCase(
      {required IProfileAvatarService profileAvatarService})
      : _profileAvatarService = profileAvatarService;

  @override
  Future<String?> updateProfileAvatarWithCamera(
      UpdateProfileAvatarRequest updateProfileAvatarRequest) {
    return _profileAvatarService
        .updateProfileAvatarDataFromCamera(updateProfileAvatarRequest.user);
  }
}

@Injectable(as: IUpdateProfileAvatarWithGalleryUseCase)
class UpdateProfileAvatarWithGalleryUseCase
    implements IUpdateProfileAvatarWithGalleryUseCase {
  final IProfileAvatarService _profileAvatarService;

  UpdateProfileAvatarWithGalleryUseCase(
      {required IProfileAvatarService profileAvatarService})
      : _profileAvatarService = profileAvatarService;

  @override
  Future<String?> updateProfileAvatarWithGallery(
      UpdateProfileAvatarRequest updateProfileAvatarRequest) {
    return _profileAvatarService
        .updateProfileAvatarDataFromGallery(updateProfileAvatarRequest.user);
  }
}

@Injectable(as: IDeleteProfileAvatarUseCase)
class DeleteProfileAvatarUseCase implements IDeleteProfileAvatarUseCase {
  final IProfileAvatarService _profileAvatarService;

  DeleteProfileAvatarUseCase(
      {required IProfileAvatarService profileAvatarService})
      : _profileAvatarService = profileAvatarService;

  @override
  Future<void> deleteProfileAvatar(
      DeleteProfileAvatarRequest deleteProfileAvatarRequest) {
    return _profileAvatarService
        .deleteProfileAvatarData(deleteProfileAvatarRequest.user);
  }
}
