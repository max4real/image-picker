import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_image_picker/home/c_home.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Image Picker",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // controller.pickImage();
                controller.pickMultiImage();
              },
              child: const Text("Choose Image"),
            ),
            // ValueListenableBuilder(
            //   valueListenable: controller.selectedImage,
            //   builder: (context, value, child) {
            //     if (value != null) {
            //       return displayImage(value);
            //     } else {
            //       return Text("no image yet");
            //     }
            //   },
            // )
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.multiImage,
                builder: (context, value, child) {
                  if (value.isNotEmpty) {
                    return GridView.builder(
                      itemCount: value.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 1),
                      itemBuilder: (context, index) {
                        return Image.file(File(value[index]!.path));
                      },
                    );
                  } else {
                    return Text("no image---");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget displayImage(XFile? pickedFile) {
    if (pickedFile != null) {
      return Image.file(File(pickedFile.path));
    } else {
      return Text('No image selected');
    }
  }
}
