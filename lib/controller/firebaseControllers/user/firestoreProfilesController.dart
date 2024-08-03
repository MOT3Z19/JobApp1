import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_app/models/usersDataModels/profileModel.dart';
import 'package:job_app/models/usersDataModels/UserProfileModel.dart';

class FirestoreController extends GetxController {
  bool? exist;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveProfile(Profile profile) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      await _firestore.collection('profiles').doc(uid).set({
        'selectedJobTypes': profile.selectedJobTypes,
        'selectedJobTimes': profile.selectedJobTimes,
        'jobTitle': profile.jobTitle,
        'companyName': profile.companyName,
        'startDate': profile.startDate,
        'endDate': profile.endDate,
        'jobNature': profile.jobNature,
        'educationLevel': profile.educationLevel,
        'university': profile.university,
        'college': profile.college,
        'graduationDate': profile.graduationDate,
        'briefDescription': profile.briefDescription,
        'cvFileUrl': profile.cvFileUrl,
      });
    } catch (e) {
      print('Error saving profile: $e');
    }
  }

  Future<void> isUserProfileExist(String userId) async {
    _firestore.collection('profiles').doc(userId).get().then((DocumentSnapshot documentSnapshot) {
      if(documentSnapshot.exists){
        documentSnapshot.data();

      }else{
        Get.showSnackbar(GetSnackBar(title: "غير موجود",));
      }
    });
  }
  Future<void> fetchUserProfile() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc('doc_id').get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();

    }
  }
}
