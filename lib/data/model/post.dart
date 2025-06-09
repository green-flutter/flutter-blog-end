import 'package:flutter_blog/data/model/user.dart';

class Post {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  Post.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        content = data['content'],
        createdAt = DateTime.parse(data['createdAt']),
        updatedAt = DateTime.parse(data['updatedAt']),
        user = User.fromMap(data['user']);
}
