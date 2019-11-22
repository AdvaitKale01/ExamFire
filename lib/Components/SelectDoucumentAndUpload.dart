import 'dart:io';

import 'package:file_picker/file_picker.dart';

File filePath;

SelectDocAndUpload() async {
  filePath =
      await FilePicker.getFile(type: FileType.CUSTOM, fileExtension: 'pdf');
  print(filePath);

  return filePath;
}
