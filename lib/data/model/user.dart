class UserModel {
  late String? id;
  late String email, fName, lName, phone, password, avatar;
  late List<String> images;

  UserModel(
      {this.id,
      this.avatar = "",
      required this.email,
      required this.fName,
      required this.lName,
      required this.phone,
      List<String>? images}) {
    this.images = images ?? [];
  }

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

  void addUserImage(String url) {
    if (!images.contains(url)) {
      images.add(url);
    }
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
