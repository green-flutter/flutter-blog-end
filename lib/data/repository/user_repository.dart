import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:logger/logger.dart';

class UserRepository {
  Future<Map<String, dynamic>> join(String username, String email, String password) async {
    final requestBody = {"username": username, "email": email, "password": password};

    Response response = await dio.post("/join", data: requestBody);
    Map<String, dynamic> responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    final requestBody = {"username": username, "password": password};

    Response response = await dio.post("/login", data: requestBody);
    Map<String, dynamic> responseBody = response.data;
    Logger().d(responseBody);

    // Header의 토큰을 body로 옮기기
    String accessToken = "";
    try {
      accessToken = response.headers["Authorization"]![0];
      responseBody["response"]["accessToken"] = accessToken;
    } catch (e) {}
    return responseBody;
  }
}
