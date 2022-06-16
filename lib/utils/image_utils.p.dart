class ImageUtils {
  ImageUtils._();

  static String random({double width = 100, double height = 100}) {
    return 'https://placehold.jp/cc9999/993333/${width}x$height.png';
  }
}
