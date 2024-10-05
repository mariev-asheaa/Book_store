part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksFailure extends NewestBooksState {
  String errormessage;
  NewestBooksFailure(this.errormessage);
}

final class NewestBooksSuccess extends NewestBooksState {
  List<BookModel>books;
  NewestBooksSuccess(this.books);
}
