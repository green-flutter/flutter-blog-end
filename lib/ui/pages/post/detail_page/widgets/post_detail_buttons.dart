import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/gvm/session_gvm.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_vm.dart';
import 'package:flutter_blog/ui/pages/post/update_page/post_update_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailButtons extends ConsumerWidget {
  Post post;

  PostDetailButtons(this.post);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionModel sessionModel = ref.read(sessionProvider);
    // isOwner 값을 sessionGVM 내부 함수로 만들어서 호출하면 가독성 증가Add commentMore actions
    bool isOwner = post.user.id == sessionModel.user!.id;

    if (sessionModel.user!.id != post.user.id) {
      return SizedBox();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () async {
              ref.read(postDetailProvider(post.id).notifier).deleteOne(post.id);
            },
            icon: const Icon(CupertinoIcons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => PostUpdatePage()));
            },
            icon: const Icon(CupertinoIcons.pen),
          ),
        ],
      );
    }
  }
}
