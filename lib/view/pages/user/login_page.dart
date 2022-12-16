
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';

import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/user/join_page.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
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
                alignment: Alignment.center,
                height: 200,
                child: Text(
                  "로그인 페이지",
                  style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                  ),
                ),
              ),
              _loginForm(),

            ],
          ),
        )
    );
  }

  Widget _loginForm() {
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
              text: "로그인",
            funPageRoute: () {
                if(_formkey.currentState!.validate()){
                 //Get.to(HomePage());
                  s.login(_username.text.trim(), _password.text.trim());
                }

            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text("아직 회원가입이 안되어 있나요?"),)
        ],
      ),
    );
  }
}


