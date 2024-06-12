import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.urlImage, this.aspectRatio});
  final String urlImage;
  final double? aspectRatio;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        // change here
        aspectRatio:  aspectRatio ??  1.4 / 2,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: urlImage,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) {
            return const Icon(Icons.image_not_supported);
          },
        ),
      ),
    );
  }
}
