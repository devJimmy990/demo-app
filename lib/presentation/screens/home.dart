import 'dart:convert';

import 'package:demo_app/cubit/counter/counter_state.dart';
import 'package:demo_app/cubit/theme/theme_state.dart';
import 'package:demo_app/presentation/widgets/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo_app/core/shared_preferences.dart';
import 'package:demo_app/data/model/user.dart';
import 'package:demo_app/core/endpoint.dart';
import 'package:demo_app/core/connection.dart';
import 'package:demo_app/data/model/dio_response.dart';
import 'package:demo_app/cubit/theme/theme_cubit.dart';
import 'package:demo_app/cubit/counter/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? cachedUsers = SharedPreference.getString(key: "users");

    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state is CounterChangeValue) {
              if (state.value == 5 || state.value == -5) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Counter reached ${state.value > 0 ? "" : "-"}5!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            if (state is CounterChangeValue) {
              return Text("Counter Value: ${state.value}");
            }
            return Text("Counter Value: 0");
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Jimmy990"),
              accountEmail: Text("jimmy@gmail.com"),
            ),
            const Spacer(),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                bool isDark = context.read<ThemeCubit>().isDark;
                return SwitchListTile(
                  title: Text("Switch ${isDark ? "Light" : "Dark"}"),
                  value: isDark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Exit"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: cachedUsers != null
            ? buildUserList((jsonDecode(cachedUsers) as List)
                .map((e) => User.fromJson(e))
                .toList())
            : FutureBuilder<DioResponse>(
                future: Connection.instance.get(url: Endpoint.users),
                builder: (context, apiSnapshot) {
                  if (apiSnapshot.connectionState == ConnectionState.waiting) {
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
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16), // Spacing between buttons
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
