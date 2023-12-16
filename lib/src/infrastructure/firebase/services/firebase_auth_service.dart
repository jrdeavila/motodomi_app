import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IAuthenticationService)
class FirebaseAuthService implements IAuthenticationService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  @override
  Stream<bool> isAuthenticated() {
    return _firebaseAuth.userChanges().map((user) => user != null);
  }

  @override
  String getUserUuid() {
    return _firebaseAuth.currentUser!.uid;
  }

  @override
  Future<void> login({required String email, required String password}) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<String> register({required String email, required String password}) {
    return _firebaseAuth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => value.user!.uid);
  }
}
