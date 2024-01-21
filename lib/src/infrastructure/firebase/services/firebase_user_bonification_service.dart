import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IClientPointsService)
class FirebaseClientPointsService implements IClientPointsService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseClientPointsService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<int> getPoints(AppUser client) {
    return _firebaseFirestore
        .collection("users")
        .doc(client.uuid)
        .get()
        .then((value) => value.data()?["points"] ?? 0);
  }

  @override
  Stream<int> listenPoints(AppUser client) {
    return _firebaseFirestore
        .collection("users")
        .doc(client.uuid)
        .snapshots()
        .map((event) => event.data()?["points"] ?? 0);
  }

  @override
  Future<void> updatePoints({required int points, required AppUser client}) {
    return _firebaseFirestore
        .collection("users")
        .doc(client.uuid)
        .update({"points": points});
  }
}

@Injectable(as: IDriverBalanceService)
class FirebaseDriverBalanceService implements IDriverBalanceService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseDriverBalanceService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<double> getBalance(DeliveryManProfile deliveryManProfile) {
    return _firebaseFirestore
        .collection("delivery_men")
        .doc(deliveryManProfile.uuid)
        .get()
        .then((value) => value.data()?["balance"] ?? 0);
  }

  @override
  Stream<double> listenBalance(DeliveryManProfile deliveryManProfile) {
    return _firebaseFirestore
        .collection("delivery_men")
        .doc(deliveryManProfile.uuid)
        .snapshots()
        .map((event) => double.parse("${event.data()?["balance"] ?? 0}"));
  }

  @override
  Future<void> updateBalance(
      {required double amount,
      required DeliveryManProfile deliveryManProfile}) {
    return _firebaseFirestore
        .collection("delivery_men")
        .doc(deliveryManProfile.uuid)
        .update({
      "balance": amount,
    });
  }
}
