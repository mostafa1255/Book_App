import 'package:booklyapp/core/utils/api_Services.dart';
import 'package:dartz/dartz.dart';
import 'package:booklyapp/core/errors/faliures.dart';
import 'package:dio/dio.dart';
import '../models/book_model/book_model.dart';
import 'home_repos.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServeces apiServeces;

  HomeRepoImpl(this.apiServeces);
  @override
  Future<Either<Faliures, List<BookModel>>> fetchNewestSellerBook() async {
    try {
      var data = await apiServeces.get(
          endpoint:
              "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming");
      List<BookModel> Books = [];

      for (var items in data["items"]) {
        try {
          Books.add(BookModel.fromJson(items));
        } on Exception catch (e) {
          Books.add(BookModel.fromJson(items));
        }
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServeces.get(
          endpoint: "volumes?Filtering=free-ebooks&q=subject:Programming");
      List<BookModel> Books = [];

      for (var items in data["items"]) {
        Books.add(BookModel.fromJson(items));
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(
        ServerFaliure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Faliures, List<BookModel>>> fetchSimilarBooks(
      {required String Category}) async {
    try {
      var data = await apiServeces.get(
          endpoint:
              "volumes?Filtering=free-ebooks&Sorting=relevance&q=$Category");
      List<BookModel> Books = [];

      for (var items in data["items"]) {
        try {
          Books.add(BookModel.fromJson(items));
        } on Exception catch (e) {
          Books.add(BookModel.fromJson(items));
        }
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }
}
