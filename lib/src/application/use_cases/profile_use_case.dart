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
