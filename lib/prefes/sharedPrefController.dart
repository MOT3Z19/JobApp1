import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  Future<void> saveEmail({String? email}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email!);
  }

  Future<void> saveId({required String userId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', userId);
  }

  Future<void> removeUser({required String email}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(email);
  }
}
