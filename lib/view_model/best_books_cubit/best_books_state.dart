part of 'best_books_cubit.dart';

@immutable
sealed class BestBooksState {}

final class BestBooksInitial extends BestBooksState {}

final class BestBooksLoading extends BestBooksState {}

final class BestBooksFailure extends BestBooksState {
  String errormessage;
  BestBooksFailure(this.errormessage);
}

final class BestBooksSuccess extends BestBooksState {

  List<BookModel>books;
  BestBooksSuccess(this.books);
}
