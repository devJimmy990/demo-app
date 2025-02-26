class User {
  final String firstName;
  final String lastName;
  final int? age;
  final String? phone;

  User({
    required this.firstName,
    required this.lastName,
    this.age,
    this.phone,
  });

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, age: $age, phone: $phone)';
  }
}