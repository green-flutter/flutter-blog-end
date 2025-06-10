import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_page.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_vm.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/post_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostListBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostListVM vm = ref.read(postListProvider.notifier);
    PostListModel? model = ref.watch(postListProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SmartRefresher(
        controller: vm.refreshCtrl,
        enablePullUp: true, // PullUp과 Refresh는 한쌍
        onRefresh: () {
          vm.init();
        },
        enablePullDown: true, // PullDown과 Loading는 한쌍
        onLoading: () {
          vm.nextList();
        },
        child: ListView.separated(
          itemCount: model.posts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailPage(model.posts[index].id)));
              },
              child: PostListItem(model.posts[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      );
    }
  }
}
