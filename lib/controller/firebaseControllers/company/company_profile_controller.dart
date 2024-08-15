import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../models/companyDataModels/companyProfileModel.dart';

class CompanyProfileController extends GetxController {
  final companyNameController = TextEditingController();
  final companyAddressController = TextEditingController();
  final establishmentDateController = TextEditingController();
  final employeeCountController = TextEditingController();
  final companyDescriptionController = TextEditingController();
  String? businessTypeController;

  var selectedImage = Rxn<Image>();
  var imageFile = Rxn<File>();
  var downloadUrl = RxnString();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveProfileCompany(ProfileCompany profile) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      await _firestore.collection('profiles_Company').doc(uid).set({
        'companyName': profile.companyName,
        'companyAddress': profile.companyAddress,
        'establishmentDate': profile.establishmentDate,
        'businessType': profile.businessType,
        'employeeCount': profile.employeeCount,
        'companyDescription': profile.companyDescription,
        'cvFileUrl': profile.cvFileUrl,
      });
    } catch (e) {
      print('Error saving profile: $e');
    }
  }

  Future<void> selectAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['svg', 'png', 'jpeg', 'jpg'],
    );

    if (result != null) {
      imageFile.value = File(result.files.single.path!);
      selectedImage.value = Image.file(imageFile.value!);

      try {
        String fileName = imageFile.value!.path.split('/').last;
        Reference storageRef =
            FirebaseStorage.instance.ref().child('image_logo/$fileName');
        UploadTask uploadTask = storageRef.putFile(imageFile.value!);

        TaskSnapshot taskSnapshot = await uploadTask;
        downloadUrl.value = await taskSnapshot.ref.getDownloadURL();
      } catch (e) {
        print('File upload error: $e');
      }
    }
  }

  Future<void> saveCompanyProfile() async {
    if (downloadUrl.value == null) {
      print('Please select and upload an image first.');
      return;
    }

    ProfileCompany profileCompany = ProfileCompany(
      companyName: companyNameController.text,
      companyAddress: companyAddressController.text,
      establishmentDate: establishmentDateController.text,
      businessType: businessTypeController.toString(),
      employeeCount: employeeCountController.text,
      companyDescription: companyDescriptionController.text,
      cvFileUrl: downloadUrl.value!,
    );
    await saveProfileCompany(profileCompany);
   // Get.to(() => Companyprofileview());

  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }
}
