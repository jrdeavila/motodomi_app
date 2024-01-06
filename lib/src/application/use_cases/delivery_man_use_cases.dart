import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IGetDeliveryManProfileUseCase)
class GetDeliveryManProfileUseCase implements IGetDeliveryManProfileUseCase {
  final IDeliveryManProfileRepository _deliveryManRepository;

  GetDeliveryManProfileUseCase(this._deliveryManRepository);

  @override
  Future<DeliveryManProfile> getDeliveryManProfile(AppUser user) async {
    return await _deliveryManRepository.getDeliveryMan(user.uuid);
  }
}

@Injectable(as: IUpdateDeliveryManProfileUseCase)
class UpdateDeliveryManProfileUseCase
    implements IUpdateDeliveryManProfileUseCase {
  final IDeliveryManProfileRepository _deliveryManRepository;

  UpdateDeliveryManProfileUseCase(this._deliveryManRepository);

  @override
  Future<DeliveryManProfile> updateDeliveryManProfile(
      UpdateDeliveryManProfileRequest request) async {
    return await _deliveryManRepository.updateDeliveryMan(
      uuid: request.user.uuid,
      firstName: request.firstName,
      lastName: request.lastName,
      phone: request.phone,
      code: request.code,
      email: request.email,
    );
  }
}

@Injectable(as: IDeleteDeliveryManProfileAvatarUseCase)
class DeleteDeliveryManProfileAvatarUseCase
    implements IDeleteDeliveryManProfileAvatarUseCase {
  final IDeliveryManProfileAvatarService _deliveryManProfileAvatarService;

  DeleteDeliveryManProfileAvatarUseCase(this._deliveryManProfileAvatarService);

  @override
  Future<void> deleteDeliveryManProfileAvatar(
    DeleteDeliveryManProfileAvatarRequest request,
  ) async {
    return await _deliveryManProfileAvatarService.deleteProfileAvatar(
      request.deliveryManProfile.uuid,
    );
  }
}

@Injectable(as: IUpdateDeliveryManProfileAvatarFromCameraUseCase)
class UpdateDeliveryManProfileAvatarFromCameraUseCase
    implements IUpdateDeliveryManProfileAvatarFromCameraUseCase {
  final IDeliveryManProfileAvatarService _deliveryManProfileAvatarService;

  UpdateDeliveryManProfileAvatarFromCameraUseCase(
      this._deliveryManProfileAvatarService);

  @override
  Future<String?> updateDeliveryManProfileAvatarFromCamera(
      UpdateDeliveryManProfileAvatarFromCameraRequest request) {
    return _deliveryManProfileAvatarService
        .updateProfileAvatarFromCamera(request.deliveryManProfile.uuid);
  }
}

@Injectable(as: IUpdateDeliveryManProfileAvatarFromGalleryUseCase)
class UpdateDeliveryManProfileAvatarFromGalleryUseCase
    implements IUpdateDeliveryManProfileAvatarFromGalleryUseCase {
  final IDeliveryManProfileAvatarService _deliveryManProfileAvatarService;

  UpdateDeliveryManProfileAvatarFromGalleryUseCase(
      this._deliveryManProfileAvatarService);

  @override
  Future<String?> updateDeliveryManProfileAvatarFromGallery(
      UpdateDeliveryManProfileAvatarFromGalleryRequest request) {
    return _deliveryManProfileAvatarService
        .updateProfileAvatarFromGallery(request.deliveryManProfile.uuid);
  }
}
