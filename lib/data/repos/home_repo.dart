import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';


abstract class HomeRepo{
  //to handle exceptions
  Future<Either<Failure,List<BookModel>>>getNewestBooks();

  Future<Either<Failure,List<BookModel>>>getBestSellerBooks();

  Future<Either<Failure,List<BookModel>>>getSimilarbooks({required String category});
}


