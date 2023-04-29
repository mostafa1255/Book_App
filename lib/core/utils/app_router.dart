import 'package:booklyapp/Features/Search/Presentation/Views/Search_View.dart';
import 'package:booklyapp/Features/home/View/Book_details.dart';
import 'package:booklyapp/Features/home/View/Screens/Home_view.dart';
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
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: searchview,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
