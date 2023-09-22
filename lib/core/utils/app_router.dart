import 'package:booklyapp/Features/home/View/Screens/Login_Screen.dart';
import 'package:booklyapp/Features/home/View/Screens/Register_Screen.dart';
import 'package:booklyapp/core/utils/Servece_Locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Search/Presentation/Views/Search_View.dart';
import '../../Features/data/models/book_model/book_model.dart';
import '../../Features/data/repos/home_repo_Impl.dart';
import '../../Features/home/Presentation/Manager/Similar Books/similar_books_cubit.dart';
import '../../Features/home/View/Book_details.dart';
import '../../Features/home/View/Screens/Home_view.dart';

abstract class Approuter {
  static const homeview = "/homeView";
  static const bookdetails = "/bookDetails";
  static const searchview = "/SearchView";
  static const loginscreen = "/LoginScreen";
  static const registerscreen = "/RegisterScreen";

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => RegisterScreen() //SplashView(),
          ),
      GoRoute(
        path: registerscreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: homeview,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: loginscreen,
        builder: (context, state) => LoginScreen(),
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
