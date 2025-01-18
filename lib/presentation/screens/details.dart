import 'package:flutter/material.dart';
import 'package:demo_app/data/model/user.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;
  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image based on gender
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                user.gender == 'male'
                    ? 'images/male.png'
                    : 'images/female.png',
              ),
            ),
            const SizedBox(height: 20),

            // User Details
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildDetailRow('First Name', user.firstName!),
                    _buildDetailRow('Last Name', user.lastName!),
                    _buildDetailRow('Age', user.age.toString()),
                    _buildDetailRow('Email', user.email!),
                    _buildDetailRow('Gender', user.gender!),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
