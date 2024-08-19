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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: TextField(
        style: TextStyle(fontFamily: 'Almarai'),
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
        ),
        readOnly: true,
        onTap: () => _selectDate(context),
      ),
    );
  }
}
