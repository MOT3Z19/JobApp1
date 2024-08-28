import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProtofileController extends GetxController {
  var selectedImages = <File>[].obs;
  var downloadUrls = <String>[].obs;

  Future<void> selectImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      selectedImages.value =
          result.paths.map((path) => File(path!)).toList().take(6).toList();
    }
  }

  Future<void> uploadImages() async {
    for (var image in selectedImages) {
      String fileName = image.path.split('/').last;
      Reference storageRef =
          FirebaseStorage.instance.ref().child('portfolio_images/$fileName');
      UploadTask uploadTask = storageRef.putFile(image);

      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('profiles_User')
        .doc(uid)
        .update({
      'portfolioImages': downloadUrls,
    });
  }
}
