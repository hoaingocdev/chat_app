part of chat;

class ImageReceive extends StatelessWidget {
  final List<String> images;

  const ImageReceive({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<_ChatModel>();

    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 20),
      child: () {
        switch (images.length) {
          case 0:
            return const SizedBox();
          case 1:
            return buildSingleImage(
              onPressed: () => model.onPhotoItemPressed(images),
            );

          case 2:
            return buildDoubleImage(
              onPressed: (i) => model.onPhotoItemPressed(images, index: i),
            );
          default:
            return buildGridImage(
              onPressed: (i) => model.onPhotoItemPressed(images, index: i),
            );
        }
      }(),
    );
  }

  Widget buildGridImage({ValueChanged<int>? onPressed}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
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
                onPressed: () => onPressed?.call(i),
              );
            },
          ),
        ),
        const SendTime(
          text: '10 : 32 AM',
        )
      ],
    );
  }

  Widget buildDoubleImage({ValueChanged<int>? onPressed}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: SizedBox(
            height: 130,
            child: Row(
              children: [
                Expanded(
                  child: ImageWidget(
                    imageUrl: images[0],
                    height: 130,
                    onPressed: () => onPressed?.call(0),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: ImageWidget(
                    imageUrl: images[1],
                    height: 130,
                    onPressed: () => onPressed?.call(1),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        const SendTime(
          text: '10 : 32 AM',
        )
      ],
    );
  }

  Widget buildSingleImage({VoidCallback? onPressed}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
            child: ImageWidget(
          imageUrl: images.first,
          onPressed: onPressed,
        )),
        const SizedBox(width: 10),
        const SendTime(
          text: '10 : 32 AM',
        )
      ],
    );
  }
}
