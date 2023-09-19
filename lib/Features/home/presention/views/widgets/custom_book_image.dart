import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1.26 / 2,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) =>  Container(color: Colors.white10 ,child: const Icon(Icons.error),),
        ),
      ),
    );
  }
}
