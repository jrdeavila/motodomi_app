class AppUser {
  String uuid;
  final String name;
  final String phone;
  final String email;
  final List<AppUserRole> roles;

  AppUser({
    required this.uuid,
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
