import 'package:flutter/material.dart';
import 'package:job_app/core/constansColor.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? selectedValue;
  final Function(String?) onChanged;

  CustomDropdown({
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 60,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsetsDirectional.symmetric(horizontal:screenWidth*.03),
          labelText: label,
          border: InputBorder.none,
        ),
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
