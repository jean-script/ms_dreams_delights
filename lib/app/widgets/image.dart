import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:ms_dreams_delights/app/utils/dir_path.dart';

class ImageWidget extends StatelessWidget {
  late final String _name;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final String? imagePath;
  ImageWidget(
    String name, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.imagePath,
  }) {
    _name = name;
  }

  @override
  Widget build(BuildContext context) {
    return imagePath != null
        ? !imagePath!.contains('.')
            ? Image.memory(
                height: height,
                width: width,
                fit: fit,
                color: color,
                base64Decode(imagePath!),
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox(width: 3),
              )
            : Image.file(
                height: height,
                width: width,
                fit: fit,
                color: color,
                File('${dirImage.path}$imagePath'),
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox(width: 3),
              )
        : Image.asset(
            'assets/img/$_name',
            height: height,
            width: width,
            fit: fit,
            color: color,
          );
  }
}
