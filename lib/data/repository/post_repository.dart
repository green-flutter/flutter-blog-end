import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:logger/logger.dart';

class PostRepository {
  Future<Map<String, dynamic>> getList({int page = 0}) async {
    Response response = await dio.get("/api/post", queryParameters: {"page": page});
    final responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }
}
