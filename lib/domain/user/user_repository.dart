import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:get/get.dart';

import '../../controller/dto/SignInReqDto.dart';
//통신을 호출해서 응답되는 데이터를 예쁘게 가공!! =>  json => Dart 오브젝트
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<void> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);

    print("================");
    print(loginReqDto.toJson());
    Response response = await _userProvider.login(loginReqDto.toJson());
    print("================");
    print(response.body);
    print("================");
    print(response.headers);
  }

  Future<void> signIn(String username, String password) async {
    SignInReqDto signInReqDto = SignInReqDto(username, password);
    Response response = await _userProvider.signIn(signInReqDto.toJson());

    //dynamic headers = response.headers;
   // String token = headers["application/json"];
    print("================");
    print(response.body);
    print("================");
    print(response.headers);
    print(signInReqDto.toJson());
    //return token;


  }

}