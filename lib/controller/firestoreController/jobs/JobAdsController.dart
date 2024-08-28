import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_app/models/companyDataModels/JobAdvertisement.dart';

class JobAdsController extends GetxController {
  List<JobAdvertisement>? _savedJob;
  String? type;
  String? educationLevel;
  String? gender;
  String? skills;
  String? jobType;
  final user = FirebaseAuth.instance.currentUser!.uid;

  final TextEditingController experience = TextEditingController();
  final TextEditingController employeeNum = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController workingHours = TextEditingController();
  final TextEditingController salary = TextEditingController();
  final TextEditingController notes = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  void addCoursesToDocument(List<Map<String, dynamic>> courses) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('jobs')
        .doc(user);
    await docRef.set({
      'jobs': FieldValue.arrayUnion(courses)
    }, SetOptions(merge: true));
    clearFormData();
  }

  void clearFormData() {
    experience.clear();
    employeeNum.clear();
    address.clear();
    workingHours.clear();
    salary.clear();
    notes.clear();

  }

  Future<List<JobAdvertisement>?> getJob() async {
    if (_savedJob != null) {
      return _savedJob;
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('profiles_Company')
        .doc('Dp2Ay1ip1VOoOif7ZgWTkgwj6s92')
        .collection('coursesAds')
        .get();
    List<JobAdvertisement> jobs = querySnapshot.docs.map((doc) {
      return JobAdvertisement.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
    if(jobs.isNotEmpty){
      _savedJob = jobs;
      return _savedJob;
    }else{
      return null;
    }


  }

}


// Future<void> submitForm() async {
//   if (_formKey.currentState!.validate()) {
//     _formKey.currentState!.save();
//
//     final jobAd = JobAdvertisement(
//       type: type ?? '',
//       gender: gender ?? '',
//       experience: experience.text,
//       jobType: jobType??'',
//       educationLevel: educationLevel ?? '',
//       skills: skills??'',
//       employeeNum: employeeNum.text??'',
//       address: address.text??'',
//       workingHours: workingHours.text??'',
//       salary: salary.text??'',
//       notes: notes.text??'',
//     );
//
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user == null) {
//         Get.snackbar('Error', 'User not authenticated');
//         return;
//       }
//       String uid = user.uid;
//       await FirebaseFirestore.instance
//           .collection('profiles_Company')
//           .doc(uid)
//           .collection('jobAdvertisements')
//           .add(jobAd.toJson());
//       Get.snackbar('Success', 'Job advertisement added successfully');
//       _formKey.currentState!.reset();
//       clearFormData();
//     } catch (e) {
//       Get.snackbar(
//           'Error', 'Failed to add job advertisement: ${e.toString()}');
//     }
//   }
// }
