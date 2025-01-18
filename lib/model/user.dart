class User {
  final int? age;
  final double? salary;
  final String? id, firstName, lastName, gender, email, birthDate;

  User({
    required this.id,
    required this.age,
    required this.email,
    required this.salary,
    required this.gender,
    required this.lastName,
    required this.firstName,
    required this.birthDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      age: json["age"],
      email: json["email"],
      gender: json["gender"],
      id: json["id"].toString(),
      birthDate: json["birthDate"],
      lastName: json["lastName"] ?? "Unknown",
      firstName: json["firstName"] ?? "Unknown",
      salary: (json["employee_salary"] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "gender": gender,
        "salary": salary,
        "lastName": lastName,
        "firstName": firstName,
        "birthDate": birthDate,
        "employee_salary": salary,
        "id": int.tryParse(id ?? "0") ?? 0,
      };

  @override
  String toString() =>
      "User{id: $id, name: $firstName $lastName, gender: $gender, email: $email, age: $age, salary: $salary}";
}
