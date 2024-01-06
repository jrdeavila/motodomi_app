abstract interface class IDeliveryManProfileAvatarService {
  Future<String?> updateProfileAvatarFromGallery(String uuid);
  Future<String?> updateProfileAvatarFromCamera(String uuid);
  Future<void> deleteProfileAvatar(String uuid);
}
