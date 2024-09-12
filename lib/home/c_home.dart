import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  ValueNotifier<XFile?> selectedImage = ValueNotifier(null);
  ValueNotifier<List<XFile?>> multiImage = ValueNotifier([]);

  Future<XFile?> pickImage() async {
    ImagePicker iPicker = ImagePicker();
    XFile? result = await iPicker.pickImage(source: ImageSource.camera);
    if (result != null) {
      selectedImage.value = result;
    }
    return result;
  }

  Future<List<XFile?>> pickMultiImage() async {
    ImagePicker picker = ImagePicker();
    List<XFile>? resultList = await picker.pickMultiImage();
    List<XFile> temp = [];
    if (resultList.isNotEmpty) {
      temp = resultList;
      multiImage.value = temp;
    }
    return resultList;
  }
}
