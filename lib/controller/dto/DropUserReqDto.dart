
class DropUserReqDto{
  final String? username;

  DropUserReqDto(this.username);

  String toDrop() {
    return username!;
  }
  //Map<String, dynamic> toJson() => {
    //"username": username,
  //};
}