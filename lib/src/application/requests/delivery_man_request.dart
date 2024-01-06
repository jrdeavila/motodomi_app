import 'package:motodomi_app/lib.dart';

class UpdateDeliveryManProfileRequest {
  final String firstName;
  final String lastName;
  final String phone;
  final String code;
  final String email;
  final String? avatar;
  final AppUser user;

  UpdateDeliveryManProfileRequest({
    required this.user,
    required this.firstName,
    required this.lastName,
    required this.code,
    required this.phone,
    required this.email,
    this.avatar,
  });
}

class UpdateDeliveryManProfileAvatarFromGalleryRequest {
  final DeliveryManProfile deliveryManProfile;

  UpdateDeliveryManProfileAvatarFromGalleryRequest({
    required this.deliveryManProfile,
  });
}

class UpdateDeliveryManProfileAvatarFromCameraRequest {
  final DeliveryManProfile deliveryManProfile;

  UpdateDeliveryManProfileAvatarFromCameraRequest({
    required this.deliveryManProfile,
  });
}

class DeleteDeliveryManProfileAvatarRequest {
  final DeliveryManProfile deliveryManProfile;

  DeleteDeliveryManProfileAvatarRequest({
    required this.deliveryManProfile,
  });
}
