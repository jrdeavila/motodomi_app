import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IUserRepository)
class FirebaseUserRepository implements IUserRepository {
  final FirebaseFirestore _firestore;

  FirebaseUserRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<AppUser> createUser(AppUser user) {
    return _firestore
        .collection('users')
        .doc(user.uuid)
        .set(userToJson(user))
        .then((value) => user);
  }

  @override
  Future<void> deleteUser(AppUser user) {
    return _firestore.collection('users').doc(user.uuid).delete();
  }

  @override
  Future<AppUser?> getUser(String uuid) {
    return _firestore.collection('users').doc(uuid).get().then((snapshot) =>
        snapshot.data() != null ? userFromJson(snapshot.data()!) : null);
  }

  @override
  Future<AppUser> updateUser(AppUser user) async {
    await _firestore
        .collection('users')
        .doc(user.uuid)
        .update(userToJsonWithoutRoles(user));

    return (await getUser(user.uuid))!;
  }

  @override
  Future<bool> isUserExists(String uuid) {
    return _firestore
        .collection('users')
        .doc(uuid)
        .get()
        .then((snapshot) => snapshot.exists);
  }
}
