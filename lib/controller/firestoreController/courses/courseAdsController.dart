import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_app/models/companyDataModels/courseAds.dart';

class CourseAdsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Course>? _savedCourse;

  String? isCertified;
  String? courseLevel;
  String? courseType;
  final TextEditingController courseName = TextEditingController();
  final TextEditingController courseHours = TextEditingController();
  final TextEditingController coursePrice = TextEditingController();
  final TextEditingController courseLocation = TextEditingController();
  final TextEditingController courseDescription = TextEditingController();
  final TextEditingController videoLink = TextEditingController();

  String uid = FirebaseAuth.instance.currentUser!.uid;

  void addCoursesToDocument(List<Map<String, dynamic>> courses) async {
    print(uid+'cccccccccccccssssssssssszzzzzzzzzxxxxxxxxxxxx');
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('courses')
        .doc(uid);
    await docRef.set({
      'course': FieldValue.arrayUnion(courses)
    }, SetOptions(merge: true));
    clearFormData();
  }



  void clearFormData() {
    courseName.clear();
    courseHours.clear();
    coursePrice.clear();
    courseLocation.clear();
    courseDescription.clear();
    videoLink.clear();

  }

  Future<List<Course>?> getCourses() async {
    if (_savedCourse != null) {
      return _savedCourse;
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('profiles_Company')
        .doc('Dp2Ay1ip1VOoOif7ZgWTkgwj6s92')
        .collection('coursesAds')
        .get();
    List<Course> courses = querySnapshot.docs.map((doc) {
      return Course.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
    if(courses.isNotEmpty){
      _savedCourse = courses;
      return _savedCourse;
    }else{
      return null;
    }


  }
}
// Future<void> submitForm() async {
//   print(courseName.text+'xxxxxxxxxxx'+courseDescription.text);
//   final course = Course(
//     courseName: courseName.text ,
//     courseHours: courseHours.text ,
//     isCertified: isCertified??'' ,
//     courseLevel: courseLevel??'',
//     courseType: courseType??'',
//     coursePrice: coursePrice.text ,
//     courseLocation: courseLocation.text,
//     courseDescription: courseDescription.text,
//     videoLink: videoLink.text,
//   );
//   await FirebaseFirestore.instance
//       .collection('profiles_Company')
//       .doc(uid)
//       .collection('coursesAds')
//       .add(course.toJson());
//   Get.snackbar('Success', 'Course added successfully');
//   clearFormData();
// }
