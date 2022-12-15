
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';

import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';

class JoinPage extends StatelessWidget {
UserRepository s = UserRepository();

  final _formkey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
                height: 200,
            child: Text("회원가입 페이지", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

            ),
            _joinForm(),
          ],
        ),
      )
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
              CustomTextFormField(
                controller: _username,
                hint: "Username",
                funValidator: validateUsername(),

              ),
              CustomTextFormField(
                controller: _password,
                  hint: "Password",
                  funValidator: validatePassword(),
              ),
              CustomElevatedButton(
                text: "회원가입",
                funPageRoute: () {
                  if(_formkey.currentState!.validate()) {
                    s.signIn(_username.text.trim(), _password.text.trim());
                    //_formkey.currentState!.save();
                    Get.to(() => LoginPage());

                  }
                },
              ),
          TextButton(
            onPressed: () {
              Get.to(() => LoginPage());
            },
            child: Text("로그인 페이지로 이동"),)
            ],
          ),
    );
  }
}


