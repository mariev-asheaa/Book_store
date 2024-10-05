import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/errors/failure.dart';
import '../../core/helper/api_service.dart';
import '../models/book_model/book_model.dart';
import 'home_repo.dart';

class Implementation implements HomeRepo{

  final Apiservice apiservice;
  Implementation(this.apiservice);
  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks() async {
    try {
      var data = await apiservice.get(
          endpoint:
          'volumes?Filtering=free-ebooks&Sorting=newest&q=novels');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    }
    catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getBestSellerBooks() async {
    try {
      var data = await apiservice.get(
          endpoint:
          'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    }
    catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getSimilarbooks({required String category}) async {
    try {
      var data = await apiservice.get(
          endpoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Science fiction');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    }
    catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}