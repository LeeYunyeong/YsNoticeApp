import 'package:get/get.dart';
//통신
const host = "http://10.10.45.25:8800";

class UserProvider extends GetConnect{
  //promise (데이터 약속)
  Future<Response> signIn(Map data) {
    print("------------------------------------------------------");
    print("host: $host");

    return post("$host/signIn", data);

  }


  Future<Response> login(Map data) => post("$host/login", data);


  Future<Response> dropUser(String data) => put("$host/dropUser", data);





}
