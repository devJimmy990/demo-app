import "package:demo_app/model/builder/user.dart";

extension UserExtension on User {
  String castUserNameAbb() =>
      "${firstName[0].toUpperCase()}${lastName[0].toUpperCase()}";
}
