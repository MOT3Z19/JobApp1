import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void shwoMassege({required String message, bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
      ),

      backgroundColor: error ? Colors.red : Colors.green,
      duration: Duration(seconds: 4),
      dismissDirection: DismissDirection.horizontal,
      // behavior: SnackBarBehavior.floating,
    ));
  }
}
