import 'package:demo_app/presentation/screens/account/page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/controller/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo_app/core/firebase_options.dart';
import 'package:demo_app/presentation/shopping/page.dart';
import 'package:demo_app/presentation/screens/auth/login.dart';
import 'package:demo_app/presentation/screens/auth/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.login: (context) => LoginPage(),
          Routes.account: (context) => AccountPage(),
          Routes.shopping: (context) => ShoppingPage(),
          Routes.register: (context) => RegistrationPage(),
        },
        initialRoute: Routes.shopping,
      ),
    );
  }
}
