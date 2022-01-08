class User {
  dynamic id, name, email, phone, token;

  User({this.id, this.name, this.email, this.phone, this.token});

  factory User.fromJson(dynamic json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      token: json["token"],
    );
  }
}
