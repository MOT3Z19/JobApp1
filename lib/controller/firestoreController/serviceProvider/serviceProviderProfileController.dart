import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_app/models/service_profile/serviceProvider.dart';

class ServiceProviderProfileController {
  final ImagePicker _picker = ImagePicker();
  ServiceProfile? _serviceProfile;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid ;


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
    await FirebaseFirestore.instance.collection('service_profiles').doc(uid).set(profile.toMap());
  }

  Future<ServiceProfile?> fetchServiceProfile() async {
    if (_serviceProfile != null) {
      return _serviceProfile;
    }
    if (uid.isEmpty) {
      throw Exception('serviceProvider is null');
    }
    DocumentSnapshot doc = await _firestore
        .collection('service_profiles')
        .doc(uid)
        .get();
    if (doc.exists) {
      _serviceProfile = ServiceProfile.fromMap(doc.data() as Map<String, dynamic>);
      return _serviceProfile;
    } else {
      return null;
    }
  }

  Future<bool> checkDocumentExists() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('service_profiles')
          .doc(uid)
          .get();
      return doc.exists;
    } catch (e) {
      print('Error checking document existence: $e');
      return false;
    }
  }
}
