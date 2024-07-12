import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordField extends StatefulWidget {
  PasswordField({required this.passcontroller});

   TextEditingController passcontroller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 10,
      controller:widget.passcontroller,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: SvgPicture.asset('assets/images/starts/password.svg',
            height: 15, width: 15,fit: BoxFit.scaleDown,),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      obscureText: _obscureText,
    );
  }
}
