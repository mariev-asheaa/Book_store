import 'package:bookly_app/core/helper/api_service.dart';
import 'package:bookly_app/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/data/repos/search_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Implementation>(Implementation(Apiservice(dio: Dio()),
  ),
  );
  getIt.registerSingleton<SearchRepoImplementation>(SearchRepoImplementation(Apiservice(dio: Dio()),
  ),
  );
}