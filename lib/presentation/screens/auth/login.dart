import 'package:demo_app/controller/user.dart';
import 'package:demo_app/data/model/user.dart';
import 'package:demo_app/presentation/widgets/ui/inputs.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/core/validator/index.dart';
import 'package:demo_app/presentation/widgets/auth/auth_option.dart';
import 'package:provider/provider.dart';

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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final controller = context.read<UserController>();
                              try {
                                await controller.login(UserModel.login(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ));
                                Navigator.pushReplacementNamed(
                                    context, Routes.shopping);
                                buildSnackBar(
                                  bgColor: Colors.green,
                                  msg: "login successfully",
                                );
                              } catch (e) {
                                buildSnackBar(
                                  bgColor: Colors.red,
                                  msg: FirebaseValidator.login(e.toString()),
                                );
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

  void buildSnackBar({
    required Color bgColor,
    required String msg,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: bgColor,
      content: Text(msg),
      duration: const Duration(seconds: 2),
      action: action,
    ));
  }
}
