import 'package:demo_app/model/builder/user.dart';

class UserBuilder {
  String? _firstName;
  String? _lastName;
  int? _age;
  String? _phone;

  UserBuilder setFirstName(String firstName) {
    _firstName = firstName;
    return this;
  }

  UserBuilder setLastName(String lastName) {
    _lastName = lastName;
    return this;
  }

  UserBuilder setAge(int age) {
    _age = age;
    return this;
  }

  UserBuilder setPhone(String phone) {
    _phone = phone;
    return this;
  }

  User build() {
    if (_firstName == null || _lastName == null) {
      throw Exception('First name and last name are required');
    }
    return User(
      age: _age,
      phone: _phone,
      lastName: _lastName!,
      firstName: _firstName!,
    );
  }
}
