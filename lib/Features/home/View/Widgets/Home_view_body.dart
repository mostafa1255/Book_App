import 'package:booklyapp/core/Styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Best_seller_List_View.dart';
import 'Custom_App_Bar.dart';
import 'Featured_List_View.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    print("in home screen with uid ${FirebaseAuth.instance.currentUser!.uid}");
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 18),
                child: Custom_AppBar(),
              ),
              const FeaturedBooksListView(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text("Best Seller",
                    style: Styles.textStyle18.copyWith(fontSize: 21)),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
