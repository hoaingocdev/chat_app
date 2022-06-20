part of chat;

class _ChatModel extends TTChangeNotifier<_ChatView> {
  final TextEditingController controller;
  final ScrollController scrollController;
  bool enable = false;

  _ChatModel()
      : controller = TextEditingController(),
        scrollController = ScrollController();

  @override
  void dispose() {
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

  void onPlusPressed() {}

  void onSendPressed() async {
    chatSrv.sendMsg(controller.text);
    await Future.delayed(const Duration(seconds: 2));
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    controller.clear();
  }

  void onPhotoItemPressed(List<String> images, {int index = 0}) {
    Navigator.of(context!).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => createPhotoView(images: images, initPage: index),
      ),
      // PageRouteBuilder(
      //   pageBuilder: (context, animation, secondaryAnimation) {
      //     return createPhotoView(
      //       images: images,
      //       initPage: index,
      //     );
      //   },
      //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //     const begin = Offset(0.0, 1.0);
      //     const end = Offset.zero;
      //     final tween = Tween(begin: begin, end: end);
      //     final offsetAnimation = animation.drive(tween);

      //     return SlideTransition(
      //       position: offsetAnimation,
      //       child: child,
      //     );
      //   },
      // ),
    );
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return createPhotoView(images: images, initPage: index);
    //     },
    //   ),
    // );
  }
}
