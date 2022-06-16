part of chat;

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final VoidCallback? onPressed;

  const ImageWidget({
    Key? key,
    required this.imageUrl,
    this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ImageNetwork(
        imageUrl: imageUrl,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
