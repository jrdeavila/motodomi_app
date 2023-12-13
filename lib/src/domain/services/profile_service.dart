import 'package:motodomi_app/lib.dart';

abstract class IProfileService {
  Future<void> updateProfileLocationData(
    AppUser user, {
    required double latitude,
    required double longitude,
  });
}
