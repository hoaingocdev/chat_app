part of photo_view;

class _PhotoViewModel extends TTChangeNotifier<_PhotoViewView> {
  final List<String> images;
  final int initPage;
  late PageController pageController;

  _PhotoViewModel(this.images, this.initPage)
      : pageController = PageController(
          initialPage: initPage,
        );

  void onClosedPressed() {
    Navigator.of(context!).pop();
  }
}
