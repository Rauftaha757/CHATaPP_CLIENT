import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }

}
class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset("assets/images/login.png")),
              Container(
                width: double.infinity,
                height: 300.h, // replace `.h` with actual height or responsive height
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r)
                ),
                child: Column(
                  children: [
                   Text("Sign In",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40.sp))

                  ],
                ),
              )

              // Container(
              //   width: ,
              // )
            ],

          ),
        ),
      )
    );
  }

}