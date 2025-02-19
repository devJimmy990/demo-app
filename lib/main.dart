import 'package:demo_app/presentation/shopping/page.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/presentation/screens/home/page.dart';
import 'package:demo_app/presentation/screens/auth/login.dart';
import 'package:demo_app/presentation/screens/auth/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.login: (context) => LoginPage(),
        Routes.shopping: (context) => ShoppingPage(),
        Routes.register: (context) => RegistrationPage(),
      },
      initialRoute: Routes.login,
    );
  }
}
