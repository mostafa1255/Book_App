import 'package:booklyapp/Features/data/repos/home_repo_Impl.dart';
import 'package:booklyapp/Features/home/Presentation/Manager/Featured%20Books/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/Presentation/Manager/Newest%20Books/newest_books_cubit.dart';
import 'package:booklyapp/core/Constants.dart';
import 'package:booklyapp/core/utils/Servece_Locator.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupGetit();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchNewestSellerBook())
      ],
      child: MaterialApp.router(
        routerConfig: Approuter.router,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
