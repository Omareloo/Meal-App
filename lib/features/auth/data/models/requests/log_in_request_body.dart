class LoginRequestBody {
  String? email;
  String? password;

  LoginRequestBody(
      { this.email, this.password});

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}
