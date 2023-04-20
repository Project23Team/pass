import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageFiles {
  static final _reference = FirebaseStorage.instance.ref();

  static Future<String?> uploadImage(PickedFile? pickerImage) async {
    if (pickerImage == null) return null;
    final imageName = pickerImage.path;
    final image = File(pickerImage.path);
    try {
      final ref = _reference.child(imageName);
      final uploadTask = ref.putFile(image);
      final snapShot = await uploadTask.whenComplete(() {});
      return await snapShot.ref.getDownloadURL();
    } catch (e) {
      print("ERORR Form Upload Image");
      print(e.toString());
      return null;
    }
  }
}
