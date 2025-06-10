// fm : Form Model, 전송할 데이터를 담는 Riverpod

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 창고 관리자
final postWriterProvider = NotifierProvider<PostWriteFM, PostWriteModel>(() {
  return PostWriteFM();
});

/// 2. 창고
class PostWriteFM extends Notifier<PostWriteModel> {
  @override
  PostWriteModel build() {
    return PostWriteModel("", "");
  }

  void title(String title) {
    state = state.copyWith(
      title: title,
    );
  }

  void content(String content) {
    state = state.copyWith(
      content: content,
    );
  }
}

/// 3. 창고 데이터 타입
class PostWriteModel {
  final String title;
  final String content;

  PostWriteModel(this.title, this.content);

  PostWriteModel copyWith({
    String? title,
    String? content,
  }) {
    return PostWriteModel(
      title ?? this.title,
      content ?? this.content,
    );
  }

  @override
  String toString() {
    return 'PostWriteModel{title: $title, content: $content}';
  }
}
