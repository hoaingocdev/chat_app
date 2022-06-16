import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? height;
  final BorderRadius? borderRadius;
  const ImageNetwork({
    Key? key,
    required this.imageUrl,
    this.fit,
    this.height,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        height: height,
      ),
    );
  }
}
