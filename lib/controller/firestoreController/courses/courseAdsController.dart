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
  final TextEditingController courseDays = TextEditingController();
  final TextEditingController courseHours = TextEditingController();
  final TextEditingController coursePrice = TextEditingController();
  final TextEditingController courseLocation = TextEditingController();
  final TextEditingController courseDescription = TextEditingController();
  final TextEditingController videoLink = TextEditingController();

  String uid = FirebaseAuth.instance.currentUser!.uid;

  void addCoursesToDocument(List<Map<String, dynamic>> courses) async {
    DocumentReference docRef =
    FirebaseFirestore.instance.collection('courses').doc(uid);
    await docRef.set(
        {'course': FieldValue.arrayUnion(courses)}, SetOptions(merge: true));

    clearFormData();
  }

  void clearFormData() {
    courseName.clear();
    courseHours.clear();
    courseDays.clear();
    coursePrice.clear();
    courseLocation.clear();
    courseDescription.clear();
    videoLink.clear();
  }

  Future<List<Course>> getCourses() async {
    List<Course> allCourses = [];
    // if(allCourses!=null){
    //   return allCourses;
    // }else{
    try {
      CollectionReference coursesCollection =
      FirebaseFirestore.instance.collection('courses');
      QuerySnapshot querySnapshot = await coursesCollection.get();
      List<Map<String, dynamic>> allCoursesData = [];
      querySnapshot.docs.forEach((doc) {
        List<dynamic> coursesList = doc['course'] ?? [];
        allCoursesData.addAll(coursesList.cast<Map<String, dynamic>>());
      });
      allCourses = allCoursesData
          .map((courseData) => Course.fromMap(courseData)).toList();
    } catch (e) {
      print('Error fetching courses: $e');
    }
    return allCourses;
   // }
  }



  Future<List<Course>> getCompanyCourses() async {
    DocumentSnapshot snapshot =
    await FirebaseFirestore.instance.collection('courses').doc(uid).get();

    if (snapshot.exists) {
      List<dynamic> coursesData = snapshot.get('course');
      return coursesData
          .map((courseData) =>
          Course.fromMap(Map<String, dynamic>.from(courseData)))
          .toList();
    } else {
      return [];
    }
  }
}