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
            child: Column(
              children: const [
                SizedBox(height: 28),
                MessegerReceive(),
                SizedBox(height: 28),
                // MessegerSentWidget(),
                ImageReceive(
                  images: [
                    'https://via.placeholder.com/1920x1080',
                    // 'https://via.placeholder.com/1920x1080',
                    // 'https://via.placeholder.com/1920x1080',
                    // 'https://via.placeholder.com/1920x1080',
                    // 'https://via.placeholder.com/1920x1080',
                    // 'https://via.placeholder.com/1920x1080',
                    // 'https://via.placeholder.com/1920x1080',
                    // 'https://via.placeholder.com/1920x1080',
                    'https://via.placeholder.com/1080x1920',
                    // 'https://via.placeholder.com/1080x1920',
                  ],
                )
              ],
            ),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              'https://cdn.chanhtuoi.com/uploads/2022/01/hinh-avatar-nam-deo-kinh.jpg',
              fit: BoxFit.cover,
            ),
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
