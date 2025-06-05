// 모든 화면에서 쓰는 View Model

import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:flutter_blog/data/repository/user_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/join_fm.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/login_fm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/// 1. 창고 관리자
final sessionProvider = NotifierProvider<SessionGVM, SessionModel>(() {
  return SessionGVM();
});

/// 2. 창고 (상태 변경되어도 갱신 X -> Watch 불가)
class SessionGVM extends Notifier<SessionModel> {
  final mContext = navigatorKey.currentContext!; // navigatorKey 연결 : 외부 context 가져오기

  @override
  SessionModel build() {
    return SessionModel();
  }

  Future<void> join(String username, String email, String password) async {
    // 로그
    Logger().d("username : ${username}, email : ${email}, password : ${password}");

    bool isValid = ref.read(joinProvider.notifier).validate();
    if (!isValid) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("유효성 검사가 올바르지 않습니다.")),
      );
      return;
    }
    Map<String, dynamic> body = await UserRepository().join(username, email, password);
    if (!body["success"]) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("${body["errorMessage"]}")),
      );
      return;
    } // 경고창 띄우기

    Navigator.pushNamed(mContext, "/login"); // 외부 context 가져오기
  }

  Future<void> login(String username, String password) async {
    // 로그
    Logger().d("username : ${username}, password : ${password}");

    // 1. 유효성 검사
    bool isValid = ref.read(loginProvider.notifier).validate();
    if (!isValid) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("유효성 검사가 올바르지 않습니다.")),
      );
      return;
    }

    // 2. 통신
    Map<String, dynamic> body = await UserRepository().login(username, password);
    if (!body["success"]) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("${body["errorMessage"]}")),
      );
      return;
    } // 경고창 띄우기

    // 3. 토큰을 디바이스에 저장
    await secureStorage.write(key: "accessToken", value: body["response"]["accessToken"]);

    // 4. 세션 갱신
    state = SessionModel(
        id: body["response"]["id"],
        username: body["response"]["username"],
        imgUrl: body["response"]["imgUrl"],
        accessToken: body["response"]["accessToken"],
        isLoggedIn: true);

    // 5. dio의 header에 토큰 세팅
    dio.options.headers["Authorization"] = body["response"]["accessToken"];

    // 6. 이동
    Navigator.popAndPushNamed(mContext, "/post/list"); // 외부 context 가져오기
  }

  Future<void> logout() async {}
}

/// 3. 창고 데이터 타입
class SessionModel {
  int? id;
  String? username;
  String? imgUrl;
  String? accessToken;
  bool? isLoggedIn;

  SessionModel({this.id, this.username, this.imgUrl, this.accessToken, this.isLoggedIn = false});
}
