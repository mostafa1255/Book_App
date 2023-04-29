import 'package:booklyapp/Features/data/models/book_model/book_model.dart';
import 'package:booklyapp/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faliures, List<BookModel>>> fetchBestSellerBook();
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks();
}
