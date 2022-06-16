part of chat;

class ImageSend extends StatelessWidget {
  final List<String> images;
  const ImageSend({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 20),
      child: () {
        switch (images.length) {
          case 0:
            return const SizedBox();
          case 1:
            return buildSingleImage();
          case 2:
            return buildDoubleImage();
          default:
            return buildGridImage();
        }
      }(),
    );
  }

  Widget buildGridImage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SendTime(
          text: '10 : 32 AM',
        ),
        const SizedBox(width: 6),
        Image.asset(Id.ic_seen),
        const SizedBox(width: 6),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: images.length,
            itemBuilder: (_, i) {
              return ImageWidget(
                imageUrl: images[i],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildDoubleImage() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 130,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SendTime(
                  text: '10 : 32 AM',
                ),
                const SizedBox(width: 6),
                Image.asset(Id.ic_seen),
                const SizedBox(width: 6),
                Expanded(
                  child: ImageWidget(
                    imageUrl: images[0],
                    height: 130,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: ImageWidget(
                    imageUrl: images[1],
                    height: 130,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSingleImage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SendTime(
          text: '10 : 32 AM',
        ),
        const SizedBox(width: 6),
        Image.asset(Id.ic_seen),
        const SizedBox(width: 6),
        Flexible(
          child: ImageWidget(
            imageUrl: images.first,
          ),
        ),
      ],
    );
  }
}
