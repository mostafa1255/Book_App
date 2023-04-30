import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.urlImage});
  final String? urlImage;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4 / 2,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  urlImage!,
                ),
                fit: BoxFit.fill)),
      ),
    );
  }
}
