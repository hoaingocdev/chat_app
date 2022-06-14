part of chat_list;

class _ChatListViewState extends TTState<_ChatListModel, _ChatListView> {
  @override
  Widget buildWithModel(BuildContext context, _ChatListModel model) {
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
