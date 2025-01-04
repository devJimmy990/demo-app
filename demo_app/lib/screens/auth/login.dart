import 'widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/generated/l10n.dart';
import 'package:demo_app/screens/auth/func/methods.dart';
import 'package:demo_app/screens/auth/widgets/snackbar.dart';
import 'package:demo_app/screens/auth/widgets/auth_option.dart';

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
      bool res = isFoundUser(_emailController.text, _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        buildSnackBar(
          content:
              res ? S.of(context).login_success : S.of(context).invalid_login,
          msg: res
              ? S.of(context).redirect_shopping
              : S.of(context).create_account_try,
          backgroundColor: res ? Colors.green : Colors.red,
          action: SnackBarAction(
            label: res ? S.of(context).ok : S.of(context).create,
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              Navigator.pushReplacementNamed(
                context,
                Routes.register,
              );
            },
          ),
        ),
      );
      if (res) {
        Navigator.pushReplacementNamed(context, Routes.shopping);
      }
    }
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
                        LoginForm(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                        ElevatedButton(
                          onPressed: onLogin,
                          child: Text(S.of(context).login),
                        ),
                        buildAuthOption(
                          msg: "${S.of(context).no_account} ",
                          action: S.of(context).create,
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

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        InputField(
          label: S.of(context).email_username,
          icon: Icons.email,
          controller: emailController,
          validator: (value) {
            if (emailController.text.isEmpty) {
              return S.of(context).required;
            }
            return null;
          },
        ),
        PasswordInputField(
          label: S.of(context).password,
          controller: passwordController,
          validator: (value) {
            if (emailController.text.isEmpty) {
              return S.of(context).required;
            }
            return null;
          },
        ),
      ],
    );
  }
}
