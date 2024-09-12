import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_image_picker/home/v_home_page.dart';

void main() {
  runApp(GetMaterialApp(
    showSemanticsDebugger: false,
    theme: ThemeData(useMaterial3: true),
    home: HomePage(),
  ));
}
