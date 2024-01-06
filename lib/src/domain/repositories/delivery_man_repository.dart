import 'package:motodomi_app/lib.dart';

abstract interface class IDeliveryManProfileRepository {
  Future<DeliveryManProfile> getDeliveryMan(String uuid);
  Future<DeliveryManProfile> updateDeliveryMan({
    required String uuid,
    required String firstName,
    required String lastName,
    required String phone,
    required String code,
    required String email,
  });
}
