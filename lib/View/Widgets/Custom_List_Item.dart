import 'package:flutter/material.dart';

import '../../core/utils/assets.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: AspectRatio(
        aspectRatio: 1.3 / 2,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AssetsData.TestImage,
                  ),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
