import 'package:bookly_app/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/errors/failure.dart';
import '../../core/helper/api_service.dart';
import '../models/book_model/book_model.dart';

class SearchRepoImplementation implements SearchRepo {
  final Apiservice apiservice;
  SearchRepoImplementation(this.apiservice);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String query}) async {
    try {
      var data = await apiservice.get(
        endpoint: 'volumes?q=$query&Filtering=free-ebooks',
      );

      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}