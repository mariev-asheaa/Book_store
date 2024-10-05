import 'package:dio/dio.dart';

class Apiservice{

  final baseurl='https://www.googleapis.com/books/v1/';
final Dio dio;
Apiservice({required this.dio});

Future<Map<String, dynamic>>get({required String endpoint}) async {

  final response = await dio.get('$baseurl$endpoint');
  return response.data;
}
}