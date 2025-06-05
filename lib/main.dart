import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/theme.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/join_page.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/login_page.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_page.dart';
import 'package:flutter_blog/ui/pages/post/write_page/post_write_page.dart';
import 'package:flutter_blog/ui/pages/splash/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: 1. Stack의 가장 위 context를 알고 있다. (지금 몰라도 됨)
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      // context가 없는 곳에서 context를 사용할 수 있는 방법 >> 경고창 or 뒤로 가기 등
      debugShowCheckedModeBanner: false,
      home: SplashPage(), // Riverpod으로 구현 : 데이터 통신 받고 넘어가는 용도
      routes: {
        "/login": (context) => const LoginPage(),
        "/join": (context) => const JoinPage(),
        "/post/list": (context) => PostListPage(),
        "/post/write": (context) => const PostWritePage(),
      },
      theme: theme(),
    );
  }
}
