import 'package:motodomi_app/lib.dart';

Map<String, dynamic> userToJson(AppUser user) => <String, dynamic>{
      'uuid': user.uuid,
      'name': user.name,
      'phone': user.phone,
      'email': user.email,
      'roles': user.roles.map((e) => e.toString().split('.').last).toList(),
    };

AppUser userFromJson(Map<String, dynamic> json) => AppUser(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => AppUserRole.values.firstWhere(
                (element) => element.toString().split('.').last == e,
              ))
          .toList(),
    );
