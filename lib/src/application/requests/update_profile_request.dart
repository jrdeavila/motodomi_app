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
