import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/usersDataModels/UserProfileModel.dart';

class ProfileDataController extends GetxController {
  TextEditingController briefDescriptionController = TextEditingController();
  File? cvFile;
  String? downloadUrl;
  var selectedFileName = ''.obs;
  var selectedImage = Rxn<Image>();
  var imageFile = Rxn<File>();
  var downloadUrlImage = RxnString();
  Profile? _userProfile;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? evaluation;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveProfile(Profile profile) async {
    List<Map<String, dynamic>> experienceMaps = profile.experiences!.map((experience) => experience.toMap()).toList();
    List<Map<String, dynamic>> edactionMaps = profile.edaction!.map((edaction) => edaction.toMap()).toList();
    List<Map<String, dynamic>> certificatesMaps = profile.certificates!.map((certificates) => certificates.toMap()).toList();

    try {
      await _firestore.collection('profiles_User').doc(uid).set({

        'fullname': profile.fullname,
        'bornPlace': profile.bornPlace,
        'bornDate': profile.bornDate,
        'stutasMarr': profile.stutasMarr,
        'phoneNumber': profile.phoneNumber,
        'email': profile.email,
        'gender': profile.gender,
        'OpentoWork': profile.OpentoWork,
        'Language': profile.Language,
        'money': profile.money,
        'OntheWork': profile.OntheWork,
        'WorkPlace': profile.WorkPlace,
        'Transfar': profile.Transfar,
        'Skills': profile.Skills,
        'showedProfile': profile.showedProfile,
        'selectedJobTypes': profile.selectedJobTypes,
        'selectedJobTimes': profile.selectedJobTimes,
        'experiences': experienceMaps,
        'education': edactionMaps,
        'certificates':certificatesMaps,
        'portfolioImages': profile.portfolioImages,
        'profilePhotoUrl': profile.profileImage,
        'videoUrl': profile.videoUrl,
        'cvText': profile.cvText
      });
    } catch (e) {
      print(
          'Error saving profile:111111111111111111111111111111111111111111 $e');
    }
  }

  Future<void> selectAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      cvFile = File(result.files.single.path!);
      selectedFileName.value = result.files.single.name;

      try {
        String fileName = cvFile!.path.split('/').last;
        Reference storageRef =
            FirebaseStorage.instance.ref().child('cv_files/$fileName');
        UploadTask uploadTask = storageRef.putFile(cvFile!);

        TaskSnapshot taskSnapshot = await uploadTask;
        downloadUrl = await taskSnapshot.ref.getDownloadURL();
        update();
      } catch (e) {
        print('File upload error: $e');
      }
    }
  }

  Future<Profile?> fetchProfile() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    //
    // if (uid != null) {
    //   return _userProfile;
    // }
    //
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String companyId = prefs.getString('id') ?? ""; // الحصول على companyId

    // if (companyId.isEmpty) {
    //   throw Exception('companyId is null');
    // }
    DocumentSnapshot doc = await _firestore
        .collection('profiles_User')
        .doc(uid)
        .get();
    if (doc.exists) {
      _userProfile = Profile.fromMap(doc.data() as Map<String, dynamic>);
      return _userProfile;
    } else {
      return null; // التعامل مع حالة عدم وجود المستند
    }
  }
  Future<bool> checkEmployeeExists() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('profiles_User')
          .doc(uid)
          .get();
      return doc.exists;
    } catch (e) {
      print('Error checking document existence: $e');
      return false;
    }
  }
}
