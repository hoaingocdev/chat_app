import 'package:image_picker/image_picker.dart';

class ImageUtils {
  ImageUtils._();
  static final ImagePicker _picker = ImagePicker();

  static String random({int width = 100, int height = 100}) {
    return 'https://placehold.jp/cc9999/993333/${width}x$height.png';
  }

  static Future<XFile?> pick() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
