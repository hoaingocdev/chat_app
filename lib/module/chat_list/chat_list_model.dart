part of chat_list;

class _ChatListModel extends TTChangeNotifier<_ChatListView> {
  void onOpenChatPressed() {
    Navigator.of(context!).push(MaterialPageRoute(builder: (_) {
      return createChat();
    }));
  }
}
