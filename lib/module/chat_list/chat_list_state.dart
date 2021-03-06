part of chat_list;

class _ChatListViewState extends TTState<_ChatListModel, _ChatListView> {
  @override
  Widget buildWithModel(BuildContext context, _ChatListModel model) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset(Id.ic_search),
        title: Text(
          'Chats',
          style: St.body18700.copyWith(color: Cl.color6274E6),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19),
            child: Center(
              child: SizedBox(
                height: 26,
                width: 26,
                child: ImageNetwork(
                  imageUrl: 'https://st.quantrimang.com/photos/image/2021/09/23/AVT-Chibi-10.jpg',
                  borderRadius: BorderRadius.circular(13),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consum<ChatService>(
        value: chatSrv,
        builder: (context, srv) {
          return ListView.separated(
            separatorBuilder: (_, i) => const SizedBox(height: 23),
            itemCount: 100,
            padding: const EdgeInsets.symmetric(vertical: 22),
            itemBuilder: (_, i) {
              return buildChatItem(
                useInfo: srv.users[i],
                onPressed: model.onOpenChatPressed,
              );
            },
          );
        },
      ),
    );
  }

  Widget buildChatItem({
    required UserInfo useInfo,
    VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ImageNetwork(
                    imageUrl: useInfo.imageUrl,
                    borderRadius: BorderRadius.circular(30),
                    fit: BoxFit.cover,
                  ),
                ),
                useInfo.isOnline
                    ? Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Cl.color6274E6,
                          border: Border.all(color: Cl.colorFFFFFF),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          useInfo.name,
                          style: St.body18700.copyWith(color: Cl.color646464),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Cl.color6274E6,
                        ),
                        child: Center(
                          child: Text(
                            useInfo.unreadDisplay,
                            style: St.body12300.copyWith(color: Cl.colorFFFFFF),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            useInfo.lastMsg,
                            style: St.body15400.copyWith(color: Cl.color979797),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          '5 : 45 PM',
                          style: St.body12300.copyWith(color: Cl.color707070),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
