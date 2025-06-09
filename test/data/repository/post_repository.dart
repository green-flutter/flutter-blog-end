import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';

void main() async {
  dio.options.headers["Authorization"] =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEucG5nIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3NDk2MDU1MTEsInVzZXJuYW1lIjoic3NhciJ9.ZK50ecQD8LEuS1jrucCw3sf-ETATjopDu3L7VPNfr42heoRC5T8g7vWpWX60ijItBPgy_1zNMj6U5dsVkZSt8Q";
  PostRepository repo = PostRepository();
  await repo.getList();
}
