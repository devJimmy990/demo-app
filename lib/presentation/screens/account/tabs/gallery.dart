import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/controller/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class BuildGalleryTab extends StatelessWidget {
  const BuildGalleryTab({super.key});

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
