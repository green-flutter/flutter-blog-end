import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/gvm/session_gvm.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/login_fm.dart';
import 'package:flutter_blog/ui/widgets/custom_auth_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_text_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class LoginForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoginFM fm = ref.read(loginProvider.notifier);
    LoginModel model = ref.watch(loginProvider);

    Logger().d(model);

    return Form(
        child: Column(
      children: [
        CustomAuthTextFormField(
          title: "Username",
          onChanged: (value) {
            fm.username(value);
          },
          errorText: model.usernameError,
        ),
        const SizedBox(height: mediumGap),
        CustomAuthTextFormField(
          title: "Password",
          onChanged: (value) {
            fm.password(value);
          },
          obscureText: true,
          errorText: model.passwordError,
        ),
        const SizedBox(height: largeGap),
        CustomElevatedButton(
          text: "로그인",
          click: () {
            ref.read(sessionProvider.notifier).login(model.username, model.password);
          },
        ),
        CustomTextButton(
          text: "회원가입 페이지로 이동",
          click: () {
            Navigator.pushNamed(context, "/join");
          },
        ),
      ],
    ));
  }
}
