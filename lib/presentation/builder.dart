import 'package:demo_app/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/extension.dart';
import 'package:demo_app/model/builder/user.dart';
import 'package:demo_app/model/builder/user_builder.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = UserBuilder()
        .setFirstName('Muhammed')
        .setPhone("01289223643")
        .setLastName('Gamal')
        .setAge(25)
        .build();

    User user2 = UserBuilder()
        .setLastName('Gamal')
        .setFirstName('Ali')
        .setAge(22)
        .build();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildText("Builder Pattern"),
        _buildUserCard(user),
        _buildUserCard(user2),
      ],
    );
  }
}

Widget _buildUserCard(User user) {
  return ListTile(
    leading: CircleAvatar(
      radius: 30,
      child: Text(user.castUserNameAbb()),
    ),
    title: Text("Name: ${user.firstName} ${user.lastName}"),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Phone: ${user.phone ?? "Not Provided"}"),
        Text("Age: ${user.age}"),
      ],
    ),
  );
}
