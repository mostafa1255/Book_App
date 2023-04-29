import 'package:booklyapp/Features/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/data/repos/home_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:booklyapp/core/errors/faliures.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Faliures, List<BookModel>>> fetchBestSellerBook() {
    // TODO: implement fetchBestSellerBook
    throw UnimplementedError();
  }

  @override
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
  
}