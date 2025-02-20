import 'package:demo_app/data/model/user.dart';

extension UserExtension on UserModel {
  String castNameAbb() {
    return "${fName[0].toUpperCase()}${lName[0].toUpperCase()}";
  }
}
