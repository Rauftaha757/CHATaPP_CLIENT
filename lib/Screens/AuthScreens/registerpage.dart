import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/Custom_Text.dart';
import '../../Utils/CutomButton.dart';
import '../../Utils/ShowCameraDialog.dart';
import '../../Utils/custom_textfilelds.dart';
import '../../Utils/imagepickercamera.dart';
import '../../Utils/imagepickergallery.dart';
import '../../controllers/Handle_Register_Api.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  bool obsec = true;
  File? selectedImage;
  late RegisterController registerController;

  @override
  void initState() {
    super.initState();
    registerController = RegisterController(context, isLoading);
  }

  void _selectImagefromGallery() async {
    final File? image = await pickImageFromGallery();
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  void _selectImagefromCamera() async {
    final File? image = await pickImageFromCamera();
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 34.h),
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
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(21.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.r),
                    child: Column(
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
                                  child: selectedImage != null
                                      ? Image.file(
                                    selectedImage!,
                                    width: 100.r,
                                    height: 100.r,
                                    fit: BoxFit.cover,
                                  )
                                      : Image.asset(
                                    "assets/images/avatar2.png",
                                    width: 70.r,
                                    height: 100.r,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
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
                                child: InkWell(
                                  onTap: () {
                                    showImageSourceDialog(
                                      context: context,
                                      onCameraTap: _selectImagefromCamera,
                                      onGalleryTap: _selectImagefromGallery,
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    size: 18.r,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        CustomTextFields(
                          controller: namecontroller,
                          obsecureText: false,
                          hinttext: "Enter Name",
                          fillcolor: Colors.grey.withOpacity(0.2),
                          height: 50,
                          width: 300,
                          keyboardtype: TextInputType.text,
                          prefixicon: Icon(Icons.person, color: Colors.black),
                        ),
                        SizedBox(height: 8.h),
                        CustomTextFields(
                          controller: emailcontroller,
                          obsecureText: false,
                          hinttext: "Enter Email",
                          fillcolor: Colors.grey.withOpacity(0.2),
                          height: 50,
                          width: 300,
                          keyboardtype: TextInputType.emailAddress,
                          prefixicon: Icon(Icons.mail, color: Colors.black),
                        ),
                        SizedBox(height: 8.h),
                        CustomTextFields(
                          controller: usernamecontroller,
                          obsecureText: false,
                          hinttext: "Enter Username",
                          fillcolor: Colors.grey.withOpacity(0.2),
                          height: 50,
                          width: 300,
                          keyboardtype: TextInputType.text,
                          prefixicon: Padding(
                            padding: EdgeInsets.all(10.r),
                            child: Image.asset(
                              "assets/images/at.png",
                              width: 10.w,
                              height: 10.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CustomTextFields(
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
                        SizedBox(height: 35.h),
                        ValueListenableBuilder<bool>(
                          valueListenable: isLoading,
                          builder: (context, loading, _) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(250.w, 50.h),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                elevation: 6,
                                shadowColor: Colors.grey,
                              ),
                              onPressed: loading
                                  ? null
                                  : () {
                                registerController.handleregister(
                                  namecontroller.text,
                                  emailcontroller.text,
                                  usernamecontroller.text,
                                  passwordcontroller.text,
                                  selectedImage,
                                );
                              },
                              child: loading
                                  ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                                  : Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
