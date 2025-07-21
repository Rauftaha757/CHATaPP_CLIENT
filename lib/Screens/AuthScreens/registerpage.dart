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
                height: 34.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customText(
                      text: "Let's get you ",
                      color: Colors.white,
                      fontsize: 40,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.sp,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    customText(
                      text: "Signed In ",
                      color: Colors.white,
                      fontsize: 30,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.sp,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),






              Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: double.infinity,
                height: 490.h,

                decoration:
                BoxDecoration(
                  color: Colors.grey.shade100, // Light grey box background
                  borderRadius: BorderRadius.circular(21.r),
                ),

                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF0F2027),
                                Color(0xFF203A43),
                                Color(0xFF2C5364),
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
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/avatar2.png",
                                width: 70.r,
                                height: 100.r,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // Pencil icon positioned at bottom right
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 18.r,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),


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
                        height: 50.h,
                        duration: Duration(milliseconds: 200),
                        child: CustomButton(text:ispressed? "" : "Register", buttoncolor: Color(0xFF000000), textcolor: Colors.white, fontWeight: FontWeight.bold,  borderRadius: BorderRadius.circular(ispressed ? 100.r : 15.r), onpressed: (){
                          setState(() {
                            ispressed=!ispressed;
                          });
                        }, fontsize: 21, elevation: 6,shadowcolor: Colors.grey,),
                      ),
                    )

                  ],
                ),
              ),
            )
          
            ],
          ),
        ),
      ),
    );
  }
}
