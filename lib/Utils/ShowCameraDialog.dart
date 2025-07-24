import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showImageSourceDialog({
  required BuildContext context,
  required VoidCallback onCameraTap,
  required VoidCallback onGalleryTap,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          "Select Image Source",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          width: 280.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, size: 24.sp),
                title: Text("Camera", style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  Navigator.pop(context);
                  onCameraTap();
                },
              ),
              Divider(height: 10.h),
              ListTile(
                leading: Icon(Icons.photo_library, size: 24.sp),
                title: Text("Gallery", style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  Navigator.pop(context);
                  onGalleryTap();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
