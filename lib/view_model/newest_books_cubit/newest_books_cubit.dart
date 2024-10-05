import 'package:bloc/bloc.dart';
import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/data/repos/home_repo.dart';
import 'package:meta/meta.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
Future<void>newestbooks()async{
  emit(NewestBooksLoading());

  var result=await homeRepo.getNewestBooks();

  result.fold((failure){
    emit(NewestBooksFailure(failure.errMessage));
  },(success){
    emit(NewestBooksSuccess(success));
  });

}
}
