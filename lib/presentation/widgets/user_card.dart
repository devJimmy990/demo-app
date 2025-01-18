import 'package:demo_app/model/user.dart';
import 'package:flutter/material.dart';

Widget buildUserCard({required User user}) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              user.gender == "male" ? "images/male.png" : "images/female.png",
            ),
            title: Text("${user.firstName} - ${user.lastName}"),
            subtitle: Text('Age: ${user.age}, Salary: ${user.salary}'),
          ),
        ),
      ),
    );
