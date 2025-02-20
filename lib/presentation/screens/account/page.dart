import 'package:demo_app/controller/user.dart';
import 'package:demo_app/core/extention/user.dart';
import 'package:demo_app/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = context.read<UserController>().user!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: user.avatar.isNotEmpty
                  ? NetworkImage(user.avatar) 
                  : null,
              child: user.avatar.isEmpty
                  ? Text(
                      user.castNameAbb(), 
                      style: const TextStyle(fontSize: 40),
                    )
                  : null,
            ),
            Text(
              '${user.fName} ${user.lName}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildInfoRow(Icons.email, user.email),
            _buildInfoRow(Icons.phone, user.phone),
          ],
        ),
      ),
    );
  }

  // Helper method to build a row with an icon and text
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
