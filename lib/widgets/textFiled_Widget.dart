import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final int? max;
  final TextEditingController controller;
  final TextInputType keybordType;

  CustomTextField({
    this.max,
    required this.label,
    required this.controller,
    required this.keybordType,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: SizedBox(
        width: screenWidth,
        child: TextField(
          keyboardType: keybordType,
          maxLines:max ,
          style: TextStyle(fontFamily: 'Almarai'),
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor:Theme.of(context).primaryColor,
            hintText: label,
            border: OutlineInputBorder( // استخدام OutlineInputBorder للحواف الدائري// ة
                borderRadius: BorderRadius.circular(10), // إضافة الحواف الدائرية
                borderSide: BorderSide.none,
                gapPadding: 12// إزالة الحد الخارجي
            ),

          ),
        ),
      ),
    );
  }
}
