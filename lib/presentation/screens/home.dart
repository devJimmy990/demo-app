import 'package:flutter/material.dart';
import 'package:demo_app/model/user.dart';
import 'package:demo_app/core/endpoint.dart';
import 'package:demo_app/core/connection.dart';
import 'package:demo_app/model/dio_response.dart';
import 'package:demo_app/presentation/widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<DioResponse>(
          future: Connection.instance.get(url: Endpoint.users),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.status == 0) {
              return Center(child: Text('Error: ${snapshot.data!.error}'));
            } else {
              final data = snapshot.data!.data!;
              final List<User> users =
                  data.map((e) => User.fromJson(e)).toList();
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) =>
                    buildUserCard(user: users[index]),
              );
            }
          },
        ),
      ),
    );
  }
}
