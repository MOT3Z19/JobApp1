import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  CustomDatePicker({
    required this.label,
    required this.controller,
  });

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight/14,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: TextField(
        style: TextStyle(fontFamily: 'Almarai'),
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).primaryColor,
          hintText: label,
          border: OutlineInputBorder( // استخدام OutlineInputBorder للحواف الدائري// ة
              borderRadius: BorderRadius.circular(10), // إضافة الحواف الدائرية
              borderSide: BorderSide.none,
              gapPadding: 12// إزالة الحد الخارجي
          ),
        ),
        readOnly: true,
        onTap: () => _selectDate(context),
      ),
    );
  }
}
