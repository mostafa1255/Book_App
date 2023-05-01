import 'package:booklyapp/Features/Search/Presentation/Views/Search_View.dart';
import 'package:booklyapp/Features/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/data/repos/home_repo_Impl.dart';
import 'package:booklyapp/Features/data/repos/home_repos.dart';
import 'package:booklyapp/Features/home/Presentation/Manager/Similar%20Books/similar_books_cubit.dart';
import 'package:booklyapp/Features/home/View/Book_details.dart';
import 'package:booklyapp/Features/home/View/Screens/Home_view.dart';
import 'package:booklyapp/core/utils/Servece_Locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/View/Screens/Splash_View.dart';

abstract class Approuter {
  static const homeview = "/homeView";
  static const bookdetails = "/bookDetails";
  static const searchview = "/SearchView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookdetails,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: searchview,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
