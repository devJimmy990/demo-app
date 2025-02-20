class UserModel {
  late String? id;
  late String email, fName, lName, phone, password, avatar;

  UserModel({
    this.id,
    this.avatar = "",
    required this.email,
    required this.fName,
    required this.lName,
    required this.phone,
  });

  UserModel.register({
    this.id,
    this.avatar = "",
    required this.email,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.password,
  });

  UserModel.login({
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      lName: json['lName'],
      fName: json['fName'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'fName': fName,
      'lName': lName,
      'avatar': avatar,
    };
  }

  @override
  String toString() =>
      "User: {name: $fName $lName, email: $email, phone: $phone}";
}
