import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AsyncImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;

  const AsyncImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.radius = 8,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.isEmpty) {
      return _placeholder();
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        width: width,
        height: height,
        fit: fit,
        placeholder: (_, _) => _loading(),
        errorWidget: (_, _, _) => _placeholder(),
      ),
    );
  }

  Widget _loading() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade800,
      alignment: Alignment.center,
      child: const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade800,
      alignment: Alignment.center,
      child: const Icon(
        Icons.movie,
        color: Colors.white54,
      ),
    );
  }
}
