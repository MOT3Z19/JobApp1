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

  Future<List<JobAdvertisement>> getJobs() async {
    List<JobAdvertisement> allJobs = [];
         try {
        CollectionReference coursesCollection =
        FirebaseFirestore.instance.collection('jobs');
        QuerySnapshot querySnapshot = await coursesCollection.get();
        List<Map<String, dynamic>> allCoursesData = [];
        querySnapshot.docs.forEach((doc) {
          List<dynamic> jobsList = doc['jobs'] ?? [];
          allCoursesData.addAll(jobsList.cast<Map<String, dynamic>>());
        });
        allJobs = allCoursesData
            .map((courseData) => JobAdvertisement.fromMap(courseData))
            .toList();
      } catch (e) {
        print('Error fetching courses: $e');
      }
      return allJobs;

  }

  Future<List<JobAdvertisement>> getCompanyJobs() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('jobs')
        .doc(user)
        .get();
    if (snapshot.exists) {
      List<dynamic> coursesData = snapshot.get('jobs');
      return coursesData.map((courseData) => JobAdvertisement.fromMap(Map<String, dynamic>.from(courseData))).toList();
    } else {
      return [];
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
