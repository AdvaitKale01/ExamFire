
import 'package:file_picker/file_picker.dart';

SelectDocAndUpload()async{
  String filePath;
  filePath = await FilePicker.getFilePath(type: FileType.CUSTOM, fileExtension: 'pdf');
print(filePath );
return
    filePath;

}