part of chat;

class _ChatModel extends TTChangeNotifier<_ChatView> {
  final TextEditingController controller;
  final ScrollController scrollController;

  final ImagePicker _picker = ImagePicker();

  bool enable = false;
  bool emojiShowing = false;

  _ChatModel()
      : controller = TextEditingController(),
        scrollController = ScrollController() {
    chatSrv.addListener(scrollListener);
  }

  @override
  void onReady() async {
    await Future.delayed(const Duration(milliseconds: 500));
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    super.onReady();
  }

  void scrollListener() {
    Future.delayed(const Duration(milliseconds: 200)).then((_) {
      if (scrollController.positions.isNotEmpty) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      }
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  void validate() {
    enable = controller.text.isNotEmpty;
    notifyListeners();
  }

  void onBackPressed() {
    Navigator.of(context!).pop();
  }

  void onStickedPressed() {}

  void onPlusPressed() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images == null || images.isEmpty) {
      return;
    }

    final List<String> imgs = [];
    for (var item in images) {
      imgs.add(item.path);
    }
    // final ls = images.map((e) => e.path).toList();

    chatSrv.sendImg(imgs);
  }

  void onSendPressed() async {
    chatSrv.sendMsg(controller.text);
    controller.clear();
  }

  void onPhotoItemPressed(List<String> images, {int index = 0}) {
    Navigator.of(context!).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => createPhotoView(images: images, initPage: index),
      ),
    );
  }
}
