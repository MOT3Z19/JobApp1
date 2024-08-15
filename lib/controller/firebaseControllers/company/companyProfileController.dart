import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_app/models/companyDataModels/companyProfileModel.dart';

class CompanyProfileController extends GetxController {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ProfileCompany? _profileCompany;


  Future<void> saveProfileCompany(ProfileCompany profile) async {
    //String uid = FirebaseAuth.instance.currentUser!.uid ??'';
    try {
      await _firestore.collection('profiles_Company').doc('KdBbuqoIECaLtaCbCEsvv').set({
        'companyName': profile.companyName,
        'companyAddress': profile.companyAddress,
        'businessType': profile.businessType,
        'employeeCount': profile.employeeCount,
        'companyDescription': profile.companyDescription,
        'cvFileUrl': profile.cvFileUrl,
        'establishmentDate': profile.establishmentDate,
      });
    } catch (e) {
      print('Error saving profile: $e');
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
    DocumentSnapshot doc = await _firestore
        .collection('profiles_Company')
        .doc('KdBbuqoIECaLtaCbCEsvv')
        .get();
    if (doc.exists) {
      _profileCompany = ProfileCompany.fromMap(doc.data() as Map<String, dynamic>);
      return _profileCompany;
    } else {
      return null; // التعامل مع حالة عدم وجود المستند
    }
  }


}
