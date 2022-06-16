part of chat;

class MessageSent extends StatelessWidget {
  final MessageInfo messageInfo;
  const MessageSent({Key? key, required this.messageInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            DateTimeUtils.format(messageInfo.date),
            style: St.body13300.copyWith(color: Cl.color9D9D9D),
          ),
          const SizedBox(width: 6),
          Image.asset(Id.ic_seen),
          const SizedBox(width: 6),
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(9, 7, 9, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Cl.color7686E9,
              ),
              child: Text(
                messageInfo.content ?? '-',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: St.body16400.copyWith(
                  color: Cl.colorFFFFFF,
                  height: 21 / 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
