import 'package:chatapp/Utils/CutomButton.dart';
import 'package:chatapp/Utils/custom_textfilelds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/Custom_Text.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }

}
class _LoginPage extends State<LoginPage> {
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  bool ispressed=false;
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
                    Padding(
                      padding:   EdgeInsets.all(10.h),
                      child: customText(text: "Let's Sign In", color: Colors.black, fontsize: 31, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.h),
                      child: CustomTextFields(controller:emailcontroller , obsecureText: false, hinttext: "Enter Email", fillcolor:Colors.grey.withOpacity(0.2), height: 50, width: 320, keyboardtype: TextInputType.text),
                    ),
                    CustomTextFields(controller: passwordcontroller, obsecureText: true, hinttext: "Enter Password", fillcolor: Colors.grey.withOpacity(0.2), height: 50, width: 320, keyboardtype: TextInputType.text),
                   Padding(
                     padding:  EdgeInsets.only(right:8.w),
                     child: Align(alignment:Alignment.centerRight,
                         child: customText(text: "Forget Password?", color: Colors.black, fontsize: 14, fontWeight: FontWeight.w500,textAlign: TextAlign.right,)),
                   ),
                    Padding(
                      padding:  EdgeInsets.only(top:25.r),
                      child: AnimatedContainer(
                        width: ispressed ? 70.w : 250.w,
                        height: 55.h,
                        duration: Duration(milliseconds: 200),
                        child: CustomButton(text:ispressed? "" : "Login", buttoncolor: Color(0xFF000000), textcolor: Colors.white, fontWeight: FontWeight.bold,  borderRadius: BorderRadius.circular(ispressed ? 110.r : 15.r), onpressed: (){
                         setState(() {
                           ispressed=!ispressed;
                         });
                        }, fontsize: 21, elevation: 6,shadowcolor: Colors.grey,),
                      ),
                    )
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