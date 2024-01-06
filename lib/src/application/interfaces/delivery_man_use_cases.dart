import 'package:motodomi_app/lib.dart';

abstract interface class IGetDeliveryManProfileUseCase {
  Future<DeliveryManProfile> getDeliveryManProfile(AppUser user);
}

abstract interface class IUpdateDeliveryManProfileUseCase {
  Future<DeliveryManProfile> updateDeliveryManProfile(
      UpdateDeliveryManProfileRequest request);
}

abstract interface class IDeleteDeliveryManProfileAvatarUseCase {
  Future<void> deleteDeliveryManProfileAvatar(
      DeleteDeliveryManProfileAvatarRequest request);
}

abstract interface class IUpdateDeliveryManProfileAvatarFromCameraUseCase {
  Future<String?> updateDeliveryManProfileAvatarFromCamera(
      UpdateDeliveryManProfileAvatarFromCameraRequest request);
}

abstract interface class IUpdateDeliveryManProfileAvatarFromGalleryUseCase {
  Future<String?> updateDeliveryManProfileAvatarFromGallery(
      UpdateDeliveryManProfileAvatarFromGalleryRequest request);
}
