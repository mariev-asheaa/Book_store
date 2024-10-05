part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  List<BookModel> books;

  SearchSuccess(this.books);
}

final class SearchFauilre extends SearchState {
  final String errorMessage;
   SearchFauilre(this.errorMessage);
}
