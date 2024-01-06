import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: IDeliveryManProfileAvatarService)
class FirebaseDeliveryManProfileService
    implements IDeliveryManProfileAvatarService {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;
  final IPickImage _pickImage;

  FirebaseDeliveryManProfileService({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseStorage firebaseStorage,
    required IPickImage pickImage,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseStorage = firebaseStorage,
        _pickImage = pickImage;

  @override
  Future<void> deleteProfileAvatar(String uuid) async {
    final ref = _firebaseStorage.ref().child('delivery_men').child(uuid);
    await ref.delete();

    return _firebaseFirestore.collection("delivery_men").doc(uuid).update({
      'profile_image': null,
    });
  }

  @override
  Future<String?> updateProfileAvatarFromCamera(String uuid) async {
    final image = await _pickImage.takePhoto();
    if (image == null) return null;
    final ref = _firebaseStorage.ref().child("delivery_men").child(uuid);
    final uploadTask = ref.putData(image);
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return _firebaseFirestore.collection('delivery_men').doc(uuid).update({
      'profile_image': url,
    }).then((value) => url);
  }

  @override
  Future<String?> updateProfileAvatarFromGallery(String uuid) async {
    final image = await _pickImage.pickImage();
    if (image == null) return null;
    final ref = _firebaseStorage.ref().child("delivery_men").child(uuid);
    final uploadTask = ref.putData(image);
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return _firebaseFirestore.collection('delivery_men').doc(uuid).update({
      'profile_image': url,
    }).then((value) => url);
  }
}
