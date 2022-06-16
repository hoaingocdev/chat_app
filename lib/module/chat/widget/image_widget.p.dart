part of chat;

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;

  const ImageWidget({Key? key, required this.imageUrl, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        height: height,
      ),
    );
  }
}
