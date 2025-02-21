import 'package:demo_app/presentation/screens/account/tabs/map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/controller/user.dart';
import 'package:demo_app/data/model/user.dart';
import 'package:demo_app/core/extention/user.dart';
import 'package:demo_app/presentation/screens/account/tabs/gallery.dart';
import 'package:demo_app/presentation/screens/account/tabs/profile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = context.read<UserController>().user!;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage:
                  user.avatar.isNotEmpty ? NetworkImage(user.avatar) : null,
              child: user.avatar.isEmpty
                  ? Text(
                      user.castNameAbb(),
                      style: const TextStyle(fontSize: 40),
                    )
                  : null,
            ),
            const SizedBox(height: 10),
            Text(
              '${user.fName} ${user.lName}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.teal.withAlpha(10),
              child: const TabBar(
                labelColor: Colors.teal,
                indicatorColor: Colors.teal,
                tabs: [
                  Tab(icon: Icon(Icons.person), text: "Profile"),
                  Tab(icon: Icon(Icons.grid_view_sharp), text: "Gallery"),
                  Tab(icon: Icon(Icons.location_on), text: "Location"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BuildProfileTab(user),
                  BuildGalleryTab(),
                  BuildMapTab()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
