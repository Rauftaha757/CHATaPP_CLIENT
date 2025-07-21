import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customText extends StatelessWidget {
  final TextAlign? textAlign;
  final String text;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  final double? letterSpacing;

  customText({
    Key? key,
    this.textAlign,
    required this.text,
    required this.color,
    required this.fontsize,
    required this.fontWeight,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontsize.sp,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
