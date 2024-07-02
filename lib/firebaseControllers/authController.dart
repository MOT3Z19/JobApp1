class FirebaseController{
  // Future<FirebaseResponse> createAccount(
  //     String email, String password, String name) async {
  //   try {
  //     UserCredential userCredential = await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     await userCredential.user!.updateDisplayName(name);
  //
  //     ///
  //     await userCredential.user!.sendEmailVerification();
  //
  //     /// سطر معتز لارسال الايميل للتاكد
  //     await _auth.signOut();
  //
  //     ///
  //     return FirebaseResponse(
  //         'تم التسجيل بنجاح', true, userCredential.user!.uid);
  //   } on FirebaseAuthException catch (e) {
  //     return FirebaseResponse('البيانات المدخلة غير صحيحة أو فارغة', false, '');
  //   } catch (e) {
  //     return FirebaseResponse('هنالك خطأ ما يرجى المحاولة', false, '');
  //   }
  // }
}