import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_vm.dart';
import 'package:flutter_blog/ui/widgets/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostUpdateForm extends ConsumerWidget {
  Post post;

  PostUpdateForm(this.post);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostDetailVM vm = ref.read(postDetailProvider(post.id).notifier);
    return Form(
      child: ListView(
        children: [
          CustomTextFormField(
            hint: "Title",
            initialValue: post.title,
          ),
          const SizedBox(height: smallGap),
          CustomTextArea(
            hint: "Content",
            initialValue: post.content,
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
            text: "글 수정하기",
            click: () {
              vm.updateOne(post);
            },
          ),
        ],
      ),
    );
  }
}
