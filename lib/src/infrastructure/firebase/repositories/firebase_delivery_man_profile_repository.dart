import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IDeliveryManProfileRepository)
class FirebaseDeliveryMnaProfileRepository
    implements IDeliveryManProfileRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseDeliveryMnaProfileRepository(this._firebaseFirestore);
  @override
  Future<DeliveryManProfile> getDeliveryMan(String uuid) {
    return _firebaseFirestore
        .collection('delivery_men')
        .doc(uuid)
        .get()
        .then((value) => deliveryManFromJson(value.data()!));
  }

  @override
  Future<DeliveryManProfile> updateDeliveryMan({
    required String uuid,
    required String firstName,
    required String lastName,
    required String phone,
    required String code,
    required String email,
  }) {
    return _firebaseFirestore.collection("delivery_men").doc(uuid).update({
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'code': code,
      'email': email,
    }).then((value) => getDeliveryMan(uuid));
  }
}
