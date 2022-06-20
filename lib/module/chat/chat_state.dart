part of chat;

class _ChatViewState extends TTState<_ChatModel, _ChatView> {
  @override
  Widget buildWithModel(BuildContext context, _ChatModel model) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Cl.colorFFFFFF,
          centerTitle: false,
          leading: const SizedBox(),
          leadingWidth: 0,
          title: buildTitle(
            onPressed: model.onBackPressed,
          ),
        ),
        body: Column(
          children: [
            const Expanded(
              child: ChatContent(),
            ),
            BottomAction(
              onStickerPressed: model.onStickedPressed,
              onPlusPressed: model.onPlusPressed,
              onSendPressed: model.enable ? model.onSendPressed : null,
            ),
            SizedBox(
              height: 5 + MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle({VoidCallback? onPressed}) {
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
