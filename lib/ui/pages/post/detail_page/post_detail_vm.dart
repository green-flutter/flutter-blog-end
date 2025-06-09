import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/repository/post_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final postDetailProvider = AutoDisposeNotifierProvider.family<PostDetailVM, PostDetailModel?, int>(() {
  return PostDetailVM();
});

// TODO 3 : init 완성하기 (state 갱신)
class PostDetailVM extends AutoDisposeFamilyNotifier<PostDetailModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  PostDetailModel? build(int postId) {
    // 1. 상태 초기화
    init(postId);

    // 2. VM 파괴되는지 확인하는 이벤트
    ref.onDispose(() {
      Logger().d("PostDetailModel 파괴됨");
    });

    // 3. 상태 값 세팅
    return null;
  }

  Future<void> deleteOne(int postId) async {
    Map<String, dynamic> body = await PostRepository().deleteOne(postId);
    if (!body["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 삭제하기 실패 : ${body["errorMessage"]}")),
      );
      return;
    }

    //init(postId);
    ref.read(postListProvider.notifier).notifyDeleteOne(postId);
    Navigator.pop(mContext);
  }

  Future<void> init(int postId) async {
    Map<String, dynamic> body = await PostRepository().getOne(postId);
    if (!body["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시글 상세보기 실패 : ${body["errorMessage"]}")),
      );
      return;
    }

    state = PostDetailModel.fromMap(body["response"]);
  }
}

// TODO 2 : replies 빼고 상태로 관리하기
class PostDetailModel {
  Post post;

  PostDetailModel(this.post);

  PostDetailModel.fromMap(Map<String, dynamic> data) : post = Post.fromMap(data);

  PostDetailModel copyWith({
    Post? post,
  }) {
    return PostDetailModel(post ?? this.post);
  }

  @override
  String toString() {
    return 'PostDetailModel(post: $post)';
  }
}
