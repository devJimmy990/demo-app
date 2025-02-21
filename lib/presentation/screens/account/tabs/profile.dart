import 'package:flutter/material.dart';
import 'package:demo_app/data/model/user.dart';

class BuildProfileTab extends StatelessWidget {
  final UserModel user;
  const BuildProfileTab(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(Icons.email, user.email),
          _buildInfoRow(Icons.phone, user.phone),
        ],
      ),
    );
  }
}

Widget _buildInfoRow(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}
