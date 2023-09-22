import 'package:booklyapp/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Faliures, List<BookModel>>> fetchNewestSellerBook();
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Faliures, List<BookModel>>> fetchSimilarBooks(
      {required String Category});
}
