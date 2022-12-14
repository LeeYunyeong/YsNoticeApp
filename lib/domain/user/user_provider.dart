import 'package:get/get.dart';
//통신
const host = "http://10.10.16.110:8800";

class UserProvider extends GetConnect{
  //promise (데이터 약속)
  Future<Response> login(Map data) => post("$host/login", data, contentType: "application/json");




  Future<Response> signIn(Map data) {

   return post("$host/signIn", data);
  }

}
