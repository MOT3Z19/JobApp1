import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class MoreTypeController extends GetxController {
  var profilePhotoUrl = ''.obs;
  var videoUrl = ''.obs;


  final ImagePicker _picker = ImagePicker();

  Future<void> uploadProfilePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);

      try {
        String fileName = 'profile_photos/${DateTime.now().millisecondsSinceEpoch}.png';
        final ref = FirebaseStorage.instance.ref().child(fileName);
        await ref.putFile(file);

        profilePhotoUrl.value = await ref.getDownloadURL();
        String uid = FirebaseAuth.instance.currentUser!.uid;

        await FirebaseFirestore.instance.collection('profiles_User').doc(uid).update({
          'profilePhotoUrl': profilePhotoUrl.value,
        });

        Get.snackbar('Success', 'Profile photo uploaded successfully');
      } catch (e) {
        Get.snackbar('Error', 'Failed to upload profile photo');
      }
    }
  }

  Future<void> uploadVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);

      try {
        String fileName = 'videos/${DateTime.now().millisecondsSinceEpoch}.mp4';
        final ref = FirebaseStorage.instance.ref().child(fileName);
        await ref.putFile(file);

        videoUrl.value = await ref.getDownloadURL();
        String uid = FirebaseAuth.instance.currentUser!.uid;

        await FirebaseFirestore.instance.collection('profiles_User').doc(uid).update({
          'videoUrl': videoUrl.value,
        });

        Get.snackbar('Success', 'Video uploaded successfully');
      } catch (e) {
        Get.snackbar('Error', 'Failed to upload video');
      }
    }
  }

}
