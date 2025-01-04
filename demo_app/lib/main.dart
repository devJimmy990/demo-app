import 'package:demo_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/screens/auth/login.dart';
import 'package:demo_app/screens/auth/register.dart';
import 'package:demo_app/screens/shopping/page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routes: {
        Routes.login: (context) => LoginPage(),
        Routes.shopping: (context) => ShoppingPage(),
        Routes.register: (context) => RegistrationPage(),
      },
      initialRoute: Routes.login,
    );
  }
}
