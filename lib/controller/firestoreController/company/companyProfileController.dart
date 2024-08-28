import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/models/companyDataModels/companyProfile.dart';

class CompanyProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ProfileCompany? _profileCompany;
  String uid = FirebaseAuth.instance.currentUser!.uid ?? '';
  File? imageFile;
  String? downloadUrl;

  final companyNameController = TextEditingController();
  final companyAddressController = TextEditingController();
  final establishmentDateController = TextEditingController();
  final employeeCountController = TextEditingController();
  final companyDescriptionController = TextEditingController();
  String? businessTypeController;


  Future<void> selectAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['svg', 'png', 'jpeg', 'jpg'],
    );

    if (result != null) {
      imageFile = File(result.files.single.path!);

      try {
        String fileName = imageFile!.path.split('/').last;
        Reference storageRef =
            FirebaseStorage.instance.ref().child('logo_company/$fileName');
        UploadTask uploadTask = storageRef.putFile(imageFile!);

        TaskSnapshot taskSnapshot = await uploadTask;
        downloadUrl = await taskSnapshot.ref.getDownloadURL();
      } catch (e) {
        print('File upload error: $e');
      }
    }
  }
  Future<void> selectDate(BuildContext context,
      TextEditingController controller) async {
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


  Future<void> saveProfileCompany() async {
    if (imageFile == null || downloadUrl == null) {
      Get.snackbar('Error', 'Please upload a logo before saving.');
      return;
    }

    ProfileCompany profileCompany = ProfileCompany(
      companyName: companyNameController.text,
      companyAddress: companyAddressController.text,
      establishmentDate: establishmentDateController.text,
      businessType: businessTypeController.toString(),
      employeeCount: employeeCountController.text,
      companyDescription: companyDescriptionController.text,
      cvFileUrl: downloadUrl!,
      visible: false,
    );

    try {
      await FirebaseFirestore.instance
          .collection('profiles_Company')
          .doc(uid)
          .set(profileCompany.toJson());
    } catch (e) {
      Get.snackbar('Error', 'Failed to save company profile: $e');
    }
  }

  // Future<ProfileCompany?> fetchProfileCompany() async {
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // String companyId = prefs.getString('id')??"";
  //   // if (companyId == null) {
  //   //   throw Exception('companyId is null');
  //   // }
  //
  //   DocumentSnapshot doc = await FirebaseFirestore.instance
  //       .collection('profiles_Company')
  //       .doc('KdBbuqoIECaLtaCbCEsvv')
  //       .get();
  //   if (doc.exists) {
  //     return ProfileCompany.fromMap(doc.data() as Map<String, dynamic>);
  //   } else {
  //     return null;
  //   }
  // }
  Future<ProfileCompany?> fetchProfileCompany() async {
    if (_profileCompany != null) {
      return _profileCompany;
    }
    //
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String companyId = prefs.getString('id') ?? ""; // الحصول على companyId

    // if (companyId.isEmpty) {
    //   throw Exception('companyId is null');
    // }
    DocumentSnapshot doc =
        await _firestore.collection('profiles_Company').doc(uid).get();
    if (doc.exists) {
      _profileCompany =
          ProfileCompany.fromMap(doc.data() as Map<String, dynamic>);
      return _profileCompany;
    } else {
      return null; // التعامل مع حالة عدم وجود المستند
    }
  }

  Future<bool> checkDocumentExists() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('profiles_Company')
          .doc(uid)
          .get();
      print('Document exists: ${doc.exists}');
      return doc.exists;
    } catch (e) {
      print('Error checking document existence: $e');
      return false;
    }
  }

  Future<bool> isVisible() async {
    try {
      DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('profiles_Company')
          .doc(uid)
          .get();
      if (document.data() != null) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        bool isVisible = data['visible'] as bool? ?? false;
        print('isVisible: $isVisible');
        print(uid);
        return isVisible;
      } else {
        print('Document data is null');

        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
// Future<bool> checkAndHandleVisibility() async {
//   try {
//     DocumentSnapshot document = await FirebaseFirestore.instance
//         .collection('profiles_Company')
//         .doc('wpo6ccRZZQeciycI6dIihJ0W9ul1')
//         .get();
//     if (document.exists) {
//       Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//       bool isVisible = data['visabl'] as bool;
//       if (isVisible) {
//         return true;
//       } else {
//         Get.snackbar(
//             "عٌَذراً", "طلبك بانشاء ملف شركة بانتظار موافقة المسؤلين",
//             backgroundColor: Colors.red,
//           duration: Duration(seconds: 5)
//         );
//         return false;
//       }
//     } else {
//       Get.snackbar(
//           "عٌَذراً", "طلبك بانشاء ملف شركة بانتظار موافقة المسؤلين",
//           backgroundColor: Colors.red,
//           duration: Duration(seconds: 5));
//       AlertDialog(
//         title:Text('يرجى انشاء ملف شركة للاطلاع على بروفايلات الموظفين'),
//        actions: [
//
//        ],
//       );
//       return false;
//
//     }
//   } catch (e) {
//     print("Error: $e");
//     return false;
//   }
// }

//
// Future<bool> checkDocumentExists() async {
//   try {
//     DocumentSnapshot doc = await FirebaseFirestore.instance
//         .collection('profiles_Company')
//         .doc(uid)
//         .get();
//     print('ccccccccccccccc${doc.exists}');
//     return doc.exists;
//
//   } catch (e) {
//     print('Error checking document existence: $e');
//     return false;
//   }
// }
//
// Future<bool> isVisible() async {
//   try {
//
//     DocumentSnapshot document = await FirebaseFirestore.instance
//         .collection('profiles_Company')
//         .doc(uid)
//         .get();
//     Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//     bool isVisible = data['visabl'] as bool;
//     print('ccccccccccccccc$isVisible');
//
//     return isVisible;
//   } catch (e) {
//     print("Error: $e");
//     return false; // في حالة حدوث خطأ
//   }
// }
}
