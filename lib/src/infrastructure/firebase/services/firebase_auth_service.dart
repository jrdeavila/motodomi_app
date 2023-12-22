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

@Injectable(as: IFacebookAuthenticationService)
class FirebaseFacebookAuthenticationService
    implements IFacebookAuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final FacebookAuth _facebookLogin;

  FirebaseFacebookAuthenticationService({
    required FirebaseAuth firebaseAuth,
    required FacebookAuth facebookLogin,
  })  : _firebaseAuth = firebaseAuth,
        _facebookLogin = facebookLogin;

  @override
  Future<void> loginWithFacebook() async {
    final result = await _facebookLogin.login();
    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken!.token;
      final credential = FacebookAuthProvider.credential(accessToken);
      await _firebaseAuth.signInWithCredential(credential);
    } else {
      throw FacebookSignInCancelledException();
    }
  }

  @override
  String getEmail() {
    return _firebaseAuth.currentUser!.email!;
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
    final isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      await _googleSignIn.signOut();
    }
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
