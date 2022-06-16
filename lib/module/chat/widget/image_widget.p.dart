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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: height,
        ),
      ),
    );
  }
}
