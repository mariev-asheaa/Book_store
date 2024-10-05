import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/book_model/book_model.dart';
import '../../data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> getSearchedBooks({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks(query: query);

    result.fold(
            (fauilre) => {
          emit(SearchFauilre(fauilre.errMessage)),
        },
            (books) => {emit(SearchSuccess(books))});
  }
}
