import 'dart:ui';
import 'package:chatapp/Utils/custom_textfilelds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../Utils/Custom_Text.dart';
import '../../Utils/CutomButton.dart';
import '../../Utils/imagepickergallery.dart';
class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obsec=true;
  File? selectedImage;

  void _selectImage() async {
    final File? image = await pickImageFromGallery();
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  bool ispressed=false;
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController usernamecontroller =TextEditingController();
  TextEditingController namecontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.h,
              ),
              customText(
                text: "Sign Up & Shine 🌟",
                textAlign: TextAlign.right,
                color: Colors.white, // or any color you want
                fontsize: 26,        // adjust size as needed
                fontWeight: FontWeight.bold,
              ),


              customText(
                text: "Sign up to get started on your fitness journey!",
                color: Colors.grey,
                fontsize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
          
              ),
            Container(
              width: 320.w,
              height: 450.h,
          
              decoration:
              BoxDecoration(
                color: Colors.grey.shade100, // Light grey box background
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  // Top-left shadow (orange instead of pink)
                  BoxShadow(
                    color: Color(0xFFF89B29).withOpacity(0.35),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: Offset(-6, -6),
                  ),
                  // Top-right shadow (pink instead of orange)
                  BoxShadow(
                    color: Color(0xFFFF0F7B).withOpacity(0.35),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: Offset(6, -6),
                  ),
                  // Bottom-left shadow (pink instead of orange)
                  BoxShadow(
                    color: Color(0xFFFF0F7B).withOpacity(0.35),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: Offset(-6, 6),
                  ),
                  // Bottom-right shadow (orange instead of pink)
                  BoxShadow(
                    color: Color(0xFFF89B29).withOpacity(0.35),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: Offset(12, 12),
                  ),
                ],
              ),


              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF0F2027), // deep navy
                          Color(0xFF203A43), // blue-gray
                          Color(0xFF2C5364), // cool navy blue
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.6),
                          spreadRadius: 4,
                          blurRadius: 15,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.transparent, // avoid white ring
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/avatar2.png",
                          width: 70.r,
                          height: 100.r,
                          fit:BoxFit.cover,
                        ),
                      ),
                    ),
                  )
          
                  ,
                  Padding(
                    padding:  EdgeInsets.only(top: 25.r),
                    child: CustomTextFields(controller: namecontroller, obsecureText: false, hinttext: "Enter Name", fillcolor: Colors.grey.withOpacity(0.2), height: 50, width: 300, keyboardtype: TextInputType.text,prefixicon: Icon(Icons.person,color: Colors.black,),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 8.r),
                    child: CustomTextFields(controller: emailcontroller, obsecureText: false, hinttext: "Enter Email", fillcolor:  Colors.grey.withOpacity(0.2), height: 50, width: 300, keyboardtype: TextInputType.text,prefixicon: Icon(Icons.mail,color: Colors.black,),),
                  ),
          
                  Padding(
                    padding: EdgeInsets.only(top: 8.r),
                    child: CustomTextFields(
                      controller: usernamecontroller,
                      obsecureText: false,
                      hinttext: "Enter Username",
                      fillcolor: Colors.grey.withOpacity(0.2),
                      height: 50,
                      width: 300,
                      keyboardtype: TextInputType.text,
                      prefixicon:  Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Image.asset(
                          "assets/images/at.png",
                          width: 10.w,
                          height: 10.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
          ,
                  Padding(
                    padding: EdgeInsets.only(top: 8.r),
                    child: CustomTextFields(
                      controller: passwordcontroller,
                      obsecureText: obsec,
                      hinttext: "Enter Password",
                      fillcolor: Colors.grey.withOpacity(0.2),
                      height: 50,
                      width: 300,
                      keyboardtype: TextInputType.text,
                      prefixicon: Icon(Icons.lock, color: Colors.black),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            obsec = !obsec;
                          });
                        },
                        child: Icon(
                          obsec ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(35.0),
                    child: AnimatedContainer(
                      width: ispressed ? 70.w : 250.w,
                      height: 45.h,
                      duration: Duration(milliseconds: 200),
                      child: CustomButton(text:ispressed? "" : "Register", buttoncolor: Color(0xFF000000), textcolor: Colors.white, fontWeight: FontWeight.bold,  borderRadius: BorderRadius.circular(ispressed ? 110.r : 30.r), onpressed: (){
                        setState(() {
                          ispressed=!ispressed;
                        });
                      }, fontsize: 21, elevation: 6,shadowcolor: Colors.grey,),
                    ),
                  )
          
                ],
              ),
            )
          
            ],
          ),
        ),
      ),
    );
  }
}
