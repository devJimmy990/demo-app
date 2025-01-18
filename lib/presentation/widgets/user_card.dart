import 'package:demo_app/data/model/user.dart';
import 'package:demo_app/presentation/screens/details.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailsScreen(user: user),
              ),
            ),
            leading: Image.asset(
              user.gender == "male" ? "images/male.png" : "images/female.png",
            ),
            title: Text("${user.firstName} - ${user.lastName}"),
            subtitle: Text('Age: ${user.age}, Salary: ${user.salary}'),
          ),
        ),
      ),
    );
  }
}
