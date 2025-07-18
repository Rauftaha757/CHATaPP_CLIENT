import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttoncolor;
  final Color textcolor;
  final FontWeight fontWeight;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback onpressed;
  final double fontsize;
  final double elevation;
  final Color ?shadowcolor;
  final Widget? child;

  const CustomButton({
    Key? key,
    required this.text,
    required this.buttoncolor,
    required this.textcolor,
    required this.fontWeight,
    required this.borderRadius,
    required this.onpressed,
    required this.fontsize,
    required this.elevation, this.shadowcolor,
    this.child

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttoncolor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: elevation,
        shadowColor: shadowcolor
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontsize.sp,
          color: textcolor,
        ),
      ),
    );
  }
}
