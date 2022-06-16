part of chat;

class _ChatViewState extends TTState<_ChatModel, _ChatView> {
  @override
  Widget buildWithModel(BuildContext context, _ChatModel model) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cl.colorFFFFFF,
        // leadingWidth: 200,
        centerTitle: false,
        leading: const SizedBox(),
        leadingWidth: 0,
        title: buildTitle(
          onPressed: model.onBackPressed,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: buildChatContent(),
          ),
          buildBottomAction(
            onStickerPressed: model.onStickedPressed,
            onPlusPressed: model.onPlusPressed,
            onSendPressed: model.onSendPressed,
          ),
          SizedBox(
            height: 5 + MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }

  Widget buildChatContent() {
    return Consum<ChatService>(
      value: chatSrv,
      builder: (context, srv) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          separatorBuilder: (_, i) => const SizedBox(height: 16),
          itemCount: srv.messages.length,
          itemBuilder: (_, i) {
            final msg = srv.messages[i];

            switch (msg.status) {
              case MessageStatus.send:
                return buildSend(msg);
              case MessageStatus.receive:
                return buildReceive(msg);
            }
          },
        );
      },
    );
  }

  Widget buildSend(MessageInfo msg) {
    switch (msg.type) {
      case MessageType.text:
        return MessageSent(messageInfo: msg);
      case MessageType.image:
        return ImageSend(messageInfo: msg);
      case MessageType.sticker:
        return const SizedBox();
    }
  }

  Widget buildReceive(MessageInfo msg) {
    switch (msg.type) {
      case MessageType.text:
        return MessageReceive(
          messageInfo: msg,
        );
      case MessageType.image:
        return ImageReceive(messageInfo: msg);
      case MessageType.sticker:
        return const SizedBox();
    }
  }

  Widget buildBottomAction({
    VoidCallback? onStickerPressed,
    VoidCallback? onPlusPressed,
    VoidCallback? onSendPressed,
  }) {
    return Container(
      height: 49,
      color: Cl.colorF6F7F8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          children: [
            MaterialButton(
                minWidth: 20,
                onPressed: onStickerPressed,
                child: Image.asset(
                  Id.ic_smile,
                  height: 20,
                )),
            Expanded(
              child: TextField(
                cursorColor: Cl.color979797,
                style: St.body17400.copyWith(color: Cl.color585858),
                decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 9),
            const Text(
              '|',
              style: TextStyle(color: Cl.colorADADAD),
            ),
            const SizedBox(width: 15),
            MaterialButton(
              minWidth: 15,
              onPressed: onStickerPressed,
              child: Image.asset(Id.ic_plus),
            ),
            // const SizedBox(width: 8),
            MaterialButton(
              minWidth: 17,
              onPressed: onStickerPressed,
              child: Image.asset(Id.ic_send),
            ),
          ],
        ),
      ),
    );
  }

  Row buildTitle({VoidCallback? onPressed}) {
    return Row(
      children: [
        InkWell(
          onTap: onPressed,
          child: Image.asset(Id.ic_arrow_left),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 36,
          width: 36,
          child: ImageNetwork(
            imageUrl: 'https://cdn.chanhtuoi.com/uploads/2022/01/hinh-avatar-nam-deo-kinh.jpg',
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rahul Sharma',
                style: St.body21700.copyWith(color: Cl.color6274E6),
              ),
              Text(
                'online',
                style: St.body12400.copyWith(color: Cl.color979797),
              ),
            ],
          ),
        ),
        Image.asset(Id.ic_menu)
      ],
    );
  }
}
