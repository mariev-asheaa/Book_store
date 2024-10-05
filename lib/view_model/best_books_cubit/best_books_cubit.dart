import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/book_model/book_model.dart';
import '../../data/repos/home_repo.dart';

part 'best_books_state.dart';

class BestBooksCubit extends Cubit<BestBooksState> {
  BestBooksCubit(this.homeRepo) : super(BestBooksInitial());

  final HomeRepo homeRepo;
  Future<void>bestbooks()async{
    emit(BestBooksLoading());

    var result=await homeRepo.getBestSellerBooks();

    result.fold((failure){
      emit(BestBooksFailure(failure.errMessage));
    },(success){
      emit(BestBooksSuccess(success));
    });

  }

}
