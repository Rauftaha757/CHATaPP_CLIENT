import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFields extends StatelessWidget {
  final TextEditingController controller;
  final bool obsecureText;
  final String hinttext;
  final Color fillcolor;
  final double height;
  final double width;
  final TextInputType keyboardtype;
  final Widget? prefixicon;
  final Widget? suffix;


  const CustomTextFields({
    Key? key,
    required this.controller,
    required this.obsecureText,
    required this.hinttext,
     required this.fillcolor,
    required this.height,
    required this.width,
    required this.keyboardtype, this.prefixicon, this.suffix,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextField(
          obscureText:obsecureText,
        controller: controller,
        obscuringCharacter: "*",
        keyboardType: keyboardtype,

        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: prefixicon,
          suffixIcon: suffix,
          hintText: hinttext,
          hintStyle:  TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
            letterSpacing: 1.2,
            height: 1.3, // line height
          ),

          filled: true,
          fillColor: fillcolor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(11.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(11.r),
          )

        ),

      ),
    );
  }}


