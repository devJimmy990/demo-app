import 'package:demo_app/controller/user.dart';
import 'package:demo_app/core/extention/user.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = context.read<UserController>();
    return Drawer(
      backgroundColor: Colors.teal,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: controller.user == null
            ? _BuildGuestDrawer()
            : _BuildUserDrawer(user: controller.user!),
      ),
    );
  }
}

class _BuildGuestDrawer extends StatelessWidget {
  const _BuildGuestDrawer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 35,
                child: Text("Guest"),
              ),
            ],
          ),
        ),
        Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, Routes.login),
              child: Text("login")),
        )
      ],
    );
  }
}

class _BuildUserDrawer extends StatelessWidget {
  final UserModel user;
  const _BuildUserDrawer({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 35,
                child: Text(user.castNameAbb()),
              ),
              Text(
                "Welcome ${user.fName} ${user.lName}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Spacer(),
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text('Account'),
          onTap: () async {
            Navigator.pushNamed(
              context,
              Routes.account,
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () async {
            await context.read<UserController>().logout();
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}
