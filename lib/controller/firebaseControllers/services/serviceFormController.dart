// lib/controllers/service_form_controller.dart
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_app/models/service_profile/service_profile.dart';

class ServiceFormController {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  Future<String> uploadImage(XFile image) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child('profile_images/${DateTime.now().toString()}');
    await imageRef.putFile(File(image.path));
    return await imageRef.getDownloadURL();
  }

  Future<void> submitForm(ServiceProfile profile) async {
    await FirebaseFirestore.instance.collection('service_profiles').add(profile.toMap());
  }
}
