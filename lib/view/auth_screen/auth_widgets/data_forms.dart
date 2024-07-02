import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTextField extends StatelessWidget {
  DataTextField({Key? key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      decoration: InputDecoration(
        prefixIcon: Image.asset(image),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
