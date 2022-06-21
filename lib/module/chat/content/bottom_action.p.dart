part of chat;

class BottomAction extends StatelessWidget {
  final VoidCallback? onStickerPressed;
  final VoidCallback? onPlusPressed;
  final VoidCallback? onSendPressed;
  const BottomAction({
    Key? key,
    this.onStickerPressed,
    this.onPlusPressed,
    this.onSendPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<_ChatModel>();

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
                controller: model.controller,
                onChanged: (v) => model.validate(),
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
            if (model.enable) // const SizedBox(width: 8),
              MaterialButton(
                minWidth: 17,
                onPressed: onSendPressed,
                child: Image.asset(Id.ic_send),
              ),
          ],
        ),
      ),
    );
  }
}
