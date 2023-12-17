import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IProfileLocationService)
class FirebaseProfileService implements IProfileLocationService {
  final FirebaseFirestore _firestore;

  FirebaseProfileService({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;
  @override
  Future<void> updateProfileLocationData(AppUser user,
      {required double latitude, required double longitude}) {
    return _firestore.collection('users').doc(user.uuid).update({
      'location': GeoPoint(latitude, longitude),
    });
  }
}

@Injectable(as: IProfileAvatarService)
class FirebaseProfileAvatarService implements IProfileAvatarService {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final IPickImage _pickImage;

  FirebaseProfileAvatarService({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
    required IPickImage pickImage,
  })  : _firestore = firestore,
        _storage = storage,
        _pickImage = pickImage;
  @override
  Future<void> deleteProfileAvatarData(AppUser user) async {
    final ref = _storage.ref().child('users').child(user.uuid);
    await ref.delete();
    return _firestore.collection('users').doc(user.uuid).update({
      'avatar': null,
    });
  }

  @override
  Future<String?> updateProfileAvatarDataFromCamera(AppUser user) async {
    final image = await _pickImage.takePhoto();
    if (image == null) return null;
    final ref = _storage.ref().child('users').child(user.uuid);
    final uploadTask = ref.putData(image);
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return _firestore.collection('users').doc(user.uuid).update({
      'avatar': url,
    }).then((value) => url);
  }

  @override
  Future<String?> updateProfileAvatarDataFromGallery(AppUser user) async {
    final image = await _pickImage.pickImage();
    if (image == null) return null;
    final ref = _storage.ref().child('users').child(user.uuid);
    final uploadTask = ref.putData(image);
    return uploadTask.whenComplete(() => null).then((snapshot) async {
      final url = await snapshot.ref.getDownloadURL();
      return _firestore.collection('users').doc(user.uuid).update({
        'avatar': url,
      }).then((value) => url);
    });
  }
}
