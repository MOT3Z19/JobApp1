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
    return DropdownButtonFormField<String>(
      padding: EdgeInsetsDirectional.symmetric(vertical: screenHight*.01,),
      menuMaxHeight: screenHight/5,
      borderRadius: BorderRadius.circular(15),
      value: selectedValue,
      isExpanded: true,
      alignment: AlignmentDirectional.bottomStart,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).primaryColor,
        contentPadding: EdgeInsetsDirectional.symmetric(horizontal:screenWidth*.03,vertical: screenHight*.01),
        labelText: label,
        border: OutlineInputBorder( // استخدام OutlineInputBorder للحواف الدائري// ة
          borderRadius: BorderRadius.circular(10), // إضافة الحواف الدائرية
          borderSide: BorderSide.none,
          gapPadding: 12// إزالة الحد الخارجي
        ),

      ),
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: SizedBox(
              width: screenWidth/2,
              child: Text(value,style: TextStyle(fontFamily: 'Almarai',fontSize: 13),)),
        );
      }).toList(),

      onChanged: onChanged,


    );
  }
}
