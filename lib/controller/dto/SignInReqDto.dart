
class SignInReqDto{
  final String? username;
  final String? password;

  SignInReqDto(this.username, this.password);

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}