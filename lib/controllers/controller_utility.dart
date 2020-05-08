import 'package:image_picker/image_picker.dart';

class UtilityController{
  static Future getImageFromGallery() async{
    return await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  static Future getImageFromCamera() async{
    return await ImagePicker.pickImage(source: ImageSource.camera);
  }
}