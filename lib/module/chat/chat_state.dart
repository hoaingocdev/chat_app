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
        title: Row(
          children: [
            Image.asset(Id.ic_arrow_left),
            SizedBox(width: 10),
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
        ),
      ),
    );
  }
}
