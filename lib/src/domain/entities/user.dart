class AppUser {
  String uuid;
  String? avatar;
  final String name;
  final String phone;
  final String email;
  final List<AppUserRole> roles;

  AppUser({
    required this.uuid,
    this.avatar,
    required this.name,
    required this.phone,
    required this.email,
    required this.roles,
  });

  bool get isAdmin => roles.contains(AppUserRole.admin);
  bool get isClient => roles.contains(AppUserRole.client);
  bool get isDriver => roles.contains(AppUserRole.driver);
}

enum AppUserRole {
  client,
  driver,
  admin,
}
