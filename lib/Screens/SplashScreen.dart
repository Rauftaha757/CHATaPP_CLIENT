import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 50.h,),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Container(
                  width: 340.w,
                  height: 200.h,
                  child: Image.asset("assets/images/sp4.png", fit: BoxFit.cover),
                ),
              ),

              Container(
                width: 350.w,
                height: 300.h,
                child: Image.asset("assets/images/sp.png", fit: BoxFit.cover),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 55.0),
              //   child: Text("Lets Chit Chat", style: TextStyle(color: Colors.black, fontSize: 30.sp, fontWeight: FontWeight.bold),),
              // )

            ],
          ),
        ),
      ),
    );
  }
}