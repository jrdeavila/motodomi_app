import 'package:motodomi_app/lib.dart';

class UpdateProfileRequest {
  final String uuid;
  final String name;
  final String phone;
  final String email;

  UpdateProfileRequest({
    required this.uuid,
    required this.name,
    required this.phone,
    required this.email,
  });
}

class UpdateProfileAvatarRequest {
  final AppUser user;

  UpdateProfileAvatarRequest({required this.user});
}

class DeleteProfileAvatarRequest {
  final AppUser user;

  DeleteProfileAvatarRequest({required this.user});
}
