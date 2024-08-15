import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDataController1 extends GetxController {
  var selectedProfileImage = Rx<File?>(null);
  var profileImageUrl = RxString('');

  Future<void> selectProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedProfileImage.value = File(pickedFile.path);
    }
  }

  Future<void> uploadProfileImage() async {
    if (selectedProfileImage.value != null) {
      try {
        String fileName = selectedProfileImage.value!.path.split('/').last;
        Reference storageRef =
        FirebaseStorage.instance.ref().child('profile_images/$fileName');
        UploadTask uploadTask = storageRef.putFile(selectedProfileImage.value!);

        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        profileImageUrl.value = downloadUrl;

        String uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance
            .collection('profiles_User')
            .doc(uid)
            .update({
          'profileImage': profileImageUrl.value,
        });
      } catch (e) {
        print('File upload error: $e');
      }
    }
  }
}
