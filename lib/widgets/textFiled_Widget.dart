import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keybordType;

  CustomTextField({
    required this.label,
    required this.controller,
    required this.keybordType,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: TextField(
        keyboardType: keybordType,
        style: TextStyle(fontFamily: 'Almarai'),
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
