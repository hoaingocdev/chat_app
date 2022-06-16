part of chat_list;

class _ChatListModel extends TTChangeNotifier<_ChatListView> {
  final chats = <UserInfo>[];

  _ChatListModel() {
    _initData();
  }

  void _initData() {
    final lschat = List.generate(100, (index) {
      return UserInfo.from({
        'imageUrl': 'https://cdn.chanhtuoi.com/uploads/2022/01/hinh-avatar-nam-deo-kinh.jpg',
        'name': 'name$index',
        'isOnline': true,
      });
    });
    chats.addAll(lschat);
  }

  void onOpenChatPressed() {
    Navigator.of(context!).push(MaterialPageRoute(builder: (_) {
      return createChat();
    }));
  }
}
