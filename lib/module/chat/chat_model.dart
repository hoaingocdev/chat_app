part of chat;

class _ChatModel extends TTChangeNotifier<_ChatView> {
  void onBackPressed() {
    Navigator.of(context!).pop();
  }

  void onStickedPressed() {}

  void onPlusPressed() {}

  void onSendPressed() {}
}
