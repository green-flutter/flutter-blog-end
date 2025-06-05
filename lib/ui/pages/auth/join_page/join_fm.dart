// fm : Form Model, 전송할 데이터를 담는 Riverpod

import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 창고 관리자
final joinProvider = NotifierProvider<JoinFM, JoinModel>(() {
  return JoinFM();
});

/// 2. 창고
class JoinFM extends Notifier<JoinModel> {
  @override
  JoinModel build() {
    return JoinModel("", "", "");
  }

  void username(String username) {
    final error = validateUsername(username);
    print("error : ${error}");
    state = state.copyWith(
      username: username,
      usernameError: error,
    );
  }

  void email(String email) {
    final error = validateEmail(email);
    state = state.copyWith(
      email: email,
      emailError: error,
    );
  }

  void password(String password) {
    final error = validatePassword(password);
    state = state.copyWith(
      password: password,
      passwordError: error,
    );
  }

  bool validate() {
    final usernameError = validateUsername(state.username);
    final emailError = validateEmail(state.email);
    final passwordError = validatePassword(state.password);

    return usernameError.isEmpty && emailError.isEmpty && passwordError.isEmpty;
  }
}

/// 3. 창고 데이터 타입
class JoinModel {
  final String username;
  final String email;
  final String password;

  final String usernameError;
  final String emailError;
  final String passwordError;

  JoinModel(
    this.username,
    this.email,
    this.password, {
    this.usernameError = "",
    this.emailError = "",
    this.passwordError = "",
  });

  JoinModel copyWith({
    String? username,
    String? email,
    String? password,
    String? usernameError,
    String? emailError,
    String? passwordError,
  }) {
    return JoinModel(
      username ?? this.username,
      email ?? this.email,
      password ?? this.password,
      usernameError: usernameError ?? this.usernameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }

  @override
  String toString() {
    return 'JoinModel{username: $username, email: $email, password: $password, usernameError: $usernameError, emailError: $emailError, passwordError: $passwordError}';
  }
}
