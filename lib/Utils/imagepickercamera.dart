import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.camera);

  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}