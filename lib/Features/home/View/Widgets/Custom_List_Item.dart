import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3 / 2,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AssetsData.TestImage,
                ),
                fit: BoxFit.fill)),
      ),
    );
  }
}
