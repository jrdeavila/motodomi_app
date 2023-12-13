import 'package:motodomi_app/lib.dart';

abstract class IUpdateProfileUseCase {
  Future<AppUser> updateProfile(UpdateProfileRequest updateProfileRequest);
}
