import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/gvm/session_gvm.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/join_fm.dart';
import 'package:flutter_blog/ui/widgets/custom_auth_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_text_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinFM fm = ref.read(joinProvider.notifier);
    JoinModel model = ref.watch(joinProvider);

    return Form(
      child: Column(
        children: [
          CustomAuthTextFormField(
            title: "Username",
            onChanged: (value) {
              fm.username(value);
              print("창고 state : ${model}");
            },
            errorText: model.usernameError,
          ),
          const SizedBox(height: mediumGap),
          CustomAuthTextFormField(
            title: "Email",
            onChanged: (value) {
              fm.email(value);
              print("창고 state : ${model}");
            },
            errorText: model.emailError,
          ),
          const SizedBox(height: mediumGap),
          CustomAuthTextFormField(
            title: "Password",
            onChanged: (value) {
              fm.password(value);
              print("창고 state : ${model}");
            },
            obscureText: true,
            errorText: model.passwordError,
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
            text: "회원가입",
            click: () {
              ref.read(sessionProvider.notifier).join(model.username, model.email, model.password);
            },
          ),
          CustomTextButton(
            text: "로그인 페이지로 이동",
            click: () {
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
