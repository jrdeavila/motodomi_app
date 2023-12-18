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
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    return _firebaseAuth.signInWithCredential(credential);
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

@Injectable(as: IGoogleAuthenticationService)
class FirebaseGoogleAuthenticationService
    implements IGoogleAuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseGoogleAuthenticationService({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  @override
  Future<void> loginWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw GoogleSignInCancelledException();
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  String getEmail() {
    return _firebaseAuth.currentUser!.email!;
  }
}

@Injectable(as: IChangePasswordService)
class FirebaseChangePasswordService implements IChangePasswordService {
  final FirebaseAuth _firebaseAuth;

  FirebaseChangePasswordService({
    @Named('FirebaseAuthForPasswordReset') required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<void> changePasswordData(
      {required AppUser user,
      required String oldPassword,
      required String newPassword,
      required String confirmPassword}) async {
    final isCorrectPassword = await _checkCurrentPassword(
      oldPassword: oldPassword,
      user: user,
    );
    if (!isCorrectPassword) {
      throw const PasswordDoesNotMatchException(code: 'wrong-password');
    }
    if (newPassword != confirmPassword) {
      throw const PasswordDoesNotMatchException();
    }

    if (oldPassword == newPassword) {
      throw const PasswordDoesNotMatchException(code: 'same-password');
    }
    return _firebaseAuth.currentUser!
        .updatePassword(newPassword)
        .then((value) => value);
  }

  Future<bool> _checkCurrentPassword({
    required String oldPassword,
    required AppUser user,
  }) async {
    await _firebaseAuth.signOut();
    try {
      final credential = EmailAuthProvider.credential(
        email: user.email,
        password: oldPassword,
      );
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return false;
      }
      return false;
    }
  }
}
