import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodeDegits extends StatelessWidget {
  const CodeDegits({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width/9,
      height: height/18,
      child: TextField(
        maxLength: 6,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
