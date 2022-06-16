part of chat;

class _ChatModel extends TTChangeNotifier<_ChatView> {
  void onBackPressed() {
    Navigator.of(context!).pop();
  }

  void onStickedPressed() {}

  void onPlusPressed() {}

  void onSendPressed() {}

  void onPhotoItemPressed(List<String> images, {int index = 0}) {
    Navigator.of(context!).push(
      MaterialPageRoute(
        builder: (_) {
          return createPhotoView(images: images, initPage: index);
        },
      ),
    );
  }
}
