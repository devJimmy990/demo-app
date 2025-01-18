  import 'package:demo_app/data/model/user.dart';
import 'package:demo_app/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';

Widget buildUserList(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => UserCard(user: users[index]),
    );
  }