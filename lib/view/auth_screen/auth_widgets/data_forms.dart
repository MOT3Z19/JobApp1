import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataTextField extends StatelessWidget {
  DataTextField({Key? key, required this.image, required this.controller,required this.keybordType });

  final String image;
  final  TextEditingController controller;
  final TextInputType keybordType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keybordType,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(image,height: 2, width: 2,
            fit: BoxFit.scaleDown),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class BackContainer extends StatelessWidget{
  final IconButton iconButton;
  const BackContainer({super.key,required this.iconButton});

  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Stack(
      alignment: AlignmentDirectional.center,
        children: [
      Container(
      width: width/6,
      height: height/13,

      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
    ),
          IconButton(

            onPressed: () {},
            icon:iconButton,
            alignment: AlignmentDirectional.center,
            iconSize: 45,



          ),
        ]);






  }
}
