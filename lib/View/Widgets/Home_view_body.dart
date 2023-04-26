import 'package:booklyapp/core/Constants.dart';
import 'package:booklyapp/core/Styles.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Custom_App_Bar.dart';
import 'Featured_List_View.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Custom_AppBar(),
        ),
        const FeaturedBooksListView(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
          child: Text("Best Seller",
              style: Styles.textStyle18.copyWith(fontSize: 23)),
        ),
        const BestSellerListview(),
      ],
    );
  }
}

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
            SizedBox(
              width: 20,
            ),
            Column(
              children: [Text("mmmmmmmmmmmmmm"), Text("jjjjjjjjjjjjjjj")],
            )
          ],
        ),
      ),
    );
  }
}
