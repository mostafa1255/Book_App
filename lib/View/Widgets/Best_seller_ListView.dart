import 'package:flutter/material.dart';

import '../../core/Constants.dart';
import '../../core/Styles.dart';
import '../../core/utils/assets.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            AspectRatio(
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
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "Harry Poter and the Goblet Of Fire",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        Styles.textStyle20.copyWith(fontFamily: KGtSectorFine),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "J.K. Rowling",
                  style: Styles.textStyle14,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "19.99 \$",
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
