part of chat;

class MessageReceive extends StatelessWidget {
  final MessageInfo messageInfo;
  const MessageReceive({Key? key, required this.messageInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(9, 7, 9, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Cl.colorF5F5F5,
              ),
              child: Text(
                messageInfo.content ?? '-',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: St.body16400.copyWith(
                  color: Cl.color585858,
                  height: 21 / 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          SendTime(
            text: DateTimeUtils.format(messageInfo.date),
          ),
        ],
      ),
    );
  }
}
