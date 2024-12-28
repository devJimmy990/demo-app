import 'package:demo_app/widgets/image_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My First Project'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  imageContainer(
                    child: Image.asset(
                      "assets/images/nature.jpeg",
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                  imageContainer(
                    child: Image.network(
                      "https://th.bing.com/th/id/OIP.0ZM7e1Z_zmebcBILunvbHQHaEn?rs=1&pid=ImgDetMain",
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "The two images are displayed",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.8,
                  fontFamily:
                      "suwannaphum", // custom font family for this widget
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
