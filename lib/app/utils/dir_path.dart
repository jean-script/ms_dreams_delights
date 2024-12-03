import 'dart:io';

import 'package:path_provider/path_provider.dart';

late Directory dirImage;

Future<Directory> myDir() async {
  return Platform.isAndroid || Platform.isIOS
      ? (await getExternalStorageDirectory() ??
          await getApplicationDocumentsDirectory())
      : Directory.current;
}

Future<Directory> createdDir() async {
  var dir = await myDir();
  var dirImages = Directory('${dir.path}/img/');

  dirImages.create(recursive: true);

  if (!(await dir.exists())) {
    dir.create(recursive: true);
  }

  return dirImages;
}
