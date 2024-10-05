import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Bookitem extends StatelessWidget {
  const Bookitem({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          //very important to handle images from the internet
          //cashed the images which high the performance
          fit: BoxFit.fill,
          imageUrl: image,
        ),
      ),
    );
  }
}
