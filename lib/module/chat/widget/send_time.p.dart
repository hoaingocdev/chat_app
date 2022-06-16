part of chat;

class SendTime extends StatelessWidget {
  final String? text;
  const SendTime({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '-',
      style: St.body13300.copyWith(color: Cl.color9D9D9D),
    );
  }
}
