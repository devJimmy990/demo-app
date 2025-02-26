import 'package:demo_app/presentation/builder.dart';
import 'package:demo_app/presentation/factory.dart';
import 'package:demo_app/presentation/singleton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Design Patterns'),
          centerTitle: true,
        ),
        body: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BuilderScreen(),
            FactoryScreen(),
            SingletonScreen(),
          ],
        ));
  }
}
