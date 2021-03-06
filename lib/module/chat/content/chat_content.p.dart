part of chat;

class ChatContent extends StatelessWidget {
  const ChatContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<_ChatModel>();
    return Consum<ChatService>(
      value: chatSrv,
      builder: (context, srv) {
        return ValueListenableBuilder<NetworkState>(
          valueListenable: srv.networkState,
          builder: (context, state, _) {
            bool isTyping = state == NetworkState.typing;
            final length = srv.messages.length;

            return ListView.separated(
              controller: model.scrollController,
              padding: const EdgeInsets.symmetric(vertical: 16),
              separatorBuilder: (_, i) => const SizedBox(height: 16),
              itemCount: length + (isTyping ? 1 : 0),
              itemBuilder: (_, i) {
                if (isTyping && i == length) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Lottie.asset(Js.typing),
                      ),
                    ),
                  );
                }
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
}
