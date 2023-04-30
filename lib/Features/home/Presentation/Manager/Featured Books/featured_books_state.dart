part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksSuccsess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccsess(
    this.books,
  );
}

class FeaturedBooksFaliure extends FeaturedBooksState {
  final String errmessage;

  const FeaturedBooksFaliure(this.errmessage);
}
