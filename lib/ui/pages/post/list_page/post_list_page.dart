import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/post_list_body.dart';
import 'package:flutter_blog/ui/widgets/custom_navigator.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class PostListPage extends StatefulWidget {
  PostListPage();

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomNavigation(scaffoldKey),
      appBar: AppBar(
        // 로그인을 수행해야 저 화면이 넘어오기 때문에 user는 절대 null이 될 수 없음 : ! 붙이기
        title: Text("Blog"),
      ),
      body: PostListBody(),
    );
  }
}
