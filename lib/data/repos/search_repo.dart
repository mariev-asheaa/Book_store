import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String query});
}