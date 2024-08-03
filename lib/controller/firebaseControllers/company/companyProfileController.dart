import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_app/models/companyDataModels/companyProfileModel.dart';

class CompanyProfileController extends GetxController {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> saveProfileCompany(ProfileCompany profile) async {
    String uid = FirebaseAuth.instance.currentUser!.uid ??'';
    try {

      await _firestore.collection('profilesCompany').doc(uid).set({
        'companyName': profile.companyName,
        'companyAddress': profile.companyAddress,
        'businessType': profile.businessType,
        'employeeCount': profile.employeeCount,
        'companyDescription': profile.companyDescription,
        'cvFileUrl': profile.cvFileUrl,
      });
    } catch (e) {
      print('Error saving profile: $e');
    }
  }


}
