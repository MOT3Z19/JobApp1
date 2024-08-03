import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:job_app/models/usersDataModels/usersData.dart';
import 'package:job_app/prefes/sharedPrefController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpController {
  SharedPrefController _sharedPrefController = Get.put(SharedPrefController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  RxBool isLoading = false.obs;
  String? phoneNum;

  Future signUp(UsersData user,String password) async {
    isLoading.value = true;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      if (userCredential.user != null) {
        await _usersCollection.doc(userCredential.user!.uid).set(user.toMap());
        Get.snackbar('Success', 'SignUp successful');
        isLoading.value = false;
        isLoading.value = false;
        String userId = userCredential.user!.uid;
        _sharedPrefController.saveId(userId: userId.toString());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        Get.snackbar('Success', 'تم تسجيل الدخول بنجاح');
        isLoading.value = false;
        String userId = userCredential.user!.uid;
        _sharedPrefController.saveId(userId: userId.toString());
        return true;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
    return false;
  }
   Future<bool>checkConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');

      }return true;
    } on SocketException catch (_) {
      print('not connected');
    }return false;
  }

  Future<void>logout()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email')??" ";
    _sharedPrefController.removeUser(email: email??"");
    print('removed');
    _auth.signOut();
  }

}
