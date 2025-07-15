import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Splashscreen extends StatelessWidget{
  const Splashscreen({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding:  EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:  EdgeInsets.only(top:16.h),
              child: Container(
                width: 350.w,
                height: 110.h,
                color: Colors.amberAccent,
                child: Image.asset("assets/images/splash3.png",fit:BoxFit.cover,),
              ),),

            Container(
              width: 350.w,
              height: 300.h,
              child: Image.asset("assets/images/splash1.jpg",fit:BoxFit.cover,),
            ),
            // Padding(
            //   padding:  EdgeInsets.only(top: 55.0),
            //   child: Text("Lets Chit Chat",style: TextStyle(color: Colors.black,fontSize: 30.sp,fontWeight: FontWeight.bold),),
            // )

          ],
        ),
      ),
    ),
  );
  }

}