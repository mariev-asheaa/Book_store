part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  String errormessage;
  SimilarBooksFailure(this.errormessage);
}

final class SimilarBookSuccess extends SimilarBooksState {

  List<BookModel>books;
  SimilarBookSuccess(this.books);
}
