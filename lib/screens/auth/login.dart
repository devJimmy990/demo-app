import 'package:demo_app/screens/auth/register.dart';
import 'package:demo_app/screens/shopping/page.dart';

import 'widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/screens/auth/func/methods.dart';
import 'package:demo_app/screens/auth/widgets/snackbar.dart';
import 'package:demo_app/screens/auth/widgets/auth_option.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void onLogin() {
    if (_formKey.currentState!.validate()) {
      final res = isFoundUser(_emailController.text, _passwordController.text);
      final snackBar = buildSnackBar(
        content: res ? "Login Successful" : "Invalid email or password",
        msg: res
            ? "Redirecting to shopping page"
            : "Create an account or try again",
        backgroundColor: res ? Colors.green : Colors.red,
        action: SnackBarAction(
          label: res ? "OK" : "Create",
          onPressed: () {
            if (!res) {
              Navigator.pushReplacementNamed(context, Routes.register);
            }
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      if (res) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 1000),
            child: const ShoppingPage(),
          ),
        );
      }
    }
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const RegistrationPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.05,
                      vertical: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InputField(
                          label: "Email or Username",
                          icon: Icons.email,
                          controller: _emailController,
                          validator: (value) {
                            if (_emailController.text.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                        ),
                        PasswordInputField(
                          label: "Password",
                          controller: _passwordController,
                          validator: (value) {
                            if (_emailController.text.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                        ),
                        ElevatedButton(
                          onPressed: onLogin,
                          child: const Text("Login"),
                        ),
                        buildAuthOption(
                          msg: "Don't have an account? ",
                          action: "create account",
                          onTap: () => Navigator.pushReplacementNamed(
                              context, Routes.register),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
