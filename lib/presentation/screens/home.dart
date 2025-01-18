import 'dart:convert';

import 'package:demo_app/presentation/widgets/users_list.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/shared_preferences.dart';
import 'package:demo_app/data/model/user.dart';
import 'package:demo_app/core/endpoint.dart';
import 'package:demo_app/core/connection.dart';
import 'package:demo_app/data/model/dio_response.dart';
import 'package:demo_app/presentation/widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? cachedUsers = SharedPreference.getString(key: "users");
    return Scaffold(
      body: SafeArea(
          child: cachedUsers != null
              ? buildUserList((jsonDecode(cachedUsers) as List)
                  .map((e) => User.fromJson(e))
                  .toList())
              : FutureBuilder<DioResponse>(
                  future: Connection.instance.get(url: Endpoint.users),
                  builder: (context, apiSnapshot) {
                    if (apiSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (apiSnapshot.hasError) {
                      return Center(child: Text('Error: ${apiSnapshot.error}'));
                    } else if (!apiSnapshot.hasData ||
                        apiSnapshot.data!.status == 0) {
                      return Center(
                          child: Text('Error: ${apiSnapshot.data!.error}'));
                    } else {
                      final List<User> users = (apiSnapshot.data!.data!)
                          .map((e) => User.fromJson(e))
                          .toList();
                      // Save data to SharedPreferences
                      SharedPreference.setString(
                          key: "users", value: jsonEncode(users));
                      return buildUserList(users);
                    }
                  },
                )),
    );
  }


}
