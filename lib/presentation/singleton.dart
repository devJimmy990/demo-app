import 'package:demo_app/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/model/singleton/singleton.dart';

class SingletonScreen extends StatelessWidget {
  const SingletonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildText("Singleton Pattern"),
        _buildSingletonView(),
        _buildSingletonView(),
      ],
    );
  }
}

Widget _buildSingletonView() {
  Singleton singleton = Singleton();
  final bool isFirst = singleton.isFirstInitialization;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: Icon(
          isFirst ? Icons.fiber_new_rounded : Icons.check_circle,
          color: isFirst ? Colors.blue : Colors.green,
        ),
      ),
      title: Text(
        isFirst ? "First Initialization" : "Already Initialized",
        style: const TextStyle(fontSize: 18),
      ),
    ),
  );
}
