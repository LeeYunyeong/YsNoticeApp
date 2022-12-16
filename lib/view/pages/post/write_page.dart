import 'package:flutter/material.dart';

import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/components/custom_textarea.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formkey,
        child: ListView(
        children: [
          CustomTextFormField(
            controller: _title,
            hint: "Title",
            funValidator: validateTitle(),
          ),
          CustomTextArea(
            controller: _content,
            hint: "content",
            funValidator: validateContent(),
          ),
          CustomElevatedButton(
            text: "글쓰기",
            funPageRoute: () {
              if(_formkey.currentState!.validate()){
                Get.off(HomePage());
              }
            },
          )
        ],
      ),
      ),
     )
    );
  }
}
