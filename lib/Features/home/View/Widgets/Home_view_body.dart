import 'package:booklyapp/Features/home/Presentation/Manager/Auth_Cubit/auth_cubit.dart';
import 'package:booklyapp/Features/home/Presentation/Manager/Layout_Cubit/layout_cubit.dart';
import 'package:booklyapp/core/Constants.dart';
import 'package:booklyapp/core/Styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Best_seller_List_View.dart';
import 'Custom_App_Bar.dart';
import 'Featured_List_View.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.sizeOf(context);
   

    constants.userUid = FirebaseAuth.instance.currentUser?.uid;
    if (kDebugMode) {
      print("====================================================");
      print(FirebaseAuth.instance.currentUser?.uid);
    }
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final layoutCubit = BlocProvider.of<LayoutCubit>(context);
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: device.width * 0.05,
                        right: device.width * 0.05,
                        top: device.height * 0.05,
                        bottom: device.height * 0.02),
                    child: const Custom_AppBar(),
                  ),
                  const FeaturedBooksListView(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: device.width * 0.05,
                        vertical: device.height * 0.02),
                    child: Text(layoutCubit.usermodel?.name ?? "Best Seller",
                        style: Styles.textStyle18
                            .copyWith(fontSize: device.width * 0.07)),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: BestSellerListView(),
            )
          ],
        );
      },
    );
  }
}
