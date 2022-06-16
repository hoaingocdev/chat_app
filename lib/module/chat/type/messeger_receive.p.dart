part of chat;

class MessegerReceive extends StatelessWidget {
  const MessegerReceive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 24,
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(9, 7, 9, 5),
              // height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Cl.colorF5F5F5,
              ),
              child: Text(
                'Bhai,Bhai, did you watch the latest trailer of Fantastic Beasts? ',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.center,
                style: St.body16400.copyWith(
                  color: Cl.color585858,
                  height: 21 / 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          const SendTime(text: '10 : 32 AM'),
        ],
      ),
    );
  }
}
