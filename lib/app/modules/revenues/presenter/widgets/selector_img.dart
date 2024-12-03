import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ms_dreams_delights/app/modules/revenues/presenter/controllers/revenues_controlle.dart';
import 'package:ms_dreams_delights/app/widgets/image.dart';

class SelectorImg extends GetView<RevenuesController> {
  SelectorImg({super.key});

  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    print('image -- ${controller.imageSelected.value.name.isEmpty}');
    return GestureDetector(
      onTap: () async {
        try {
          print('open image');
          final response = await picker.pickImage(source: ImageSource.gallery);

          print('viem reposnse $response');
          if (response == null) return;
          controller.onImageSelected(response);
        } catch (e) {
          print('error ${e.toString()}');
        }
      },
      child: Stack(
        children: [
          Obx(
            () => controller.imageSelected.value.name.isEmpty
                ? controller.isEdit
                    ? ImageWidget(
                        'default.png',
                        imagePath: controller.revenuesDetail?.image,
                        width: MediaQuery.of(context).size.width,
                        height: 173,
                        fit: BoxFit.contain,
                      )
                    : SizedBox(
                        height: 173,
                        width: MediaQuery.of(context).size.width,
                      )
                : Image.file(
                    File(controller.imageSelected.value.path),
                    width: MediaQuery.of(context).size.width,
                    height: 173,
                    fit: BoxFit.contain,
                  ),
          ),
          Positioned.fill(
            child: Icon(
              Icons.image_search_outlined,
              size: 90,
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
