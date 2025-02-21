import 'dart:io';

import 'package:demo_app/controller/user.dart';
import 'package:demo_app/core/extention/user.dart';
import 'package:demo_app/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = context.read<UserController>().user!;

    return DefaultTabController(
      length: 2,
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
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _BuildProfileTab(user),
                  _BuildGalleryTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildGalleryTab extends StatelessWidget {
  const _BuildGalleryTab();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpandableFabState> fabKey = GlobalKey();
    final ImagePicker picker = ImagePicker();
    final UserController controller = context.watch<UserController>();
    final List<String> list = controller.images;
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: fabKey,
        fanAngle: 60,
        distance: 65,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.photo_camera),
            onPressed: () async {
              final XFile? image =
                  await picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                controller.addUserImages(File(image.path));
              }
              fabKey.currentState?.toggle();
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.image),
            onPressed: () async {
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                controller.addUserImages(File(image.path));
              }
              fabKey.currentState?.toggle();
            },
          ),
        ],
      ),
      body: list.isEmpty
          ? const Center(
              child: Text(
                "no images to display",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) =>
                    _BuildUserImageByType(list[index]),
              ),
            ),
    );
  }
}

class _BuildProfileTab extends StatelessWidget {
  final UserModel user;
  const _BuildProfileTab(this.user);

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

class _BuildUserImageByType extends StatelessWidget {
  final String url;
  const _BuildUserImageByType(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: url.contains("data/user")
          ? Image.file(
              File(url),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _errorWidget(),
            )
          : Image.network(
              url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return _loadingWidget();
              },
              errorBuilder: (context, error, stackTrace) => _errorWidget(),
            ),
    );
  }

  Widget _loadingWidget() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _errorWidget() => const Center(
        child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
      );
}
