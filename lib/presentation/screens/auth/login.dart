import '../../widgets/ui/inputs.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/presentation/widgets/auth/auth_option.dart';
import 'package:demo_app/presentation/screens/auth/func/methods.dart';

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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              bool res = isFoundUser(
                                _emailController.text,
                                _passwordController.text,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  _buildLoginSnackBar(res, context));

                              if (res) {
                                Navigator.pushReplacementNamed(
                                    context, Routes.home);
                              }
                            }
                          },
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

  SnackBar _buildLoginSnackBar(bool res, BuildContext context) {
    return SnackBar(
      backgroundColor: res ? Colors.green : Colors.red,
      content: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  '${res ? "Login Successful" : "Invalid email or password"}\n',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: res
                  ? "will redirect to shopping page"
                  : "create account or try again",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: res ? "OK" : "create",
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Navigator.pushReplacementNamed(
            context,
            Routes.register,
          );
        },
      ),
    );
  }
}
