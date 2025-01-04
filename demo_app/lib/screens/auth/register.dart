import 'widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/generated/l10n.dart';
import 'package:demo_app/core/string_extension.dart';
import 'package:demo_app/screens/auth/func/methods.dart';
import 'package:demo_app/screens/auth/widgets/snackbar.dart';
import 'package:demo_app/screens/auth/widgets/auth_option.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;
  late final TextEditingController _confirmPasswordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _lastNameController = TextEditingController();
    _firstNameController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
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
                      spacing: 40,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RegistrationForm(
                          phoneController: _phoneController,
                          emailController: _emailController,
                          usernameController: _usernameController,
                          passwordController: _passwordController,
                          lastNameController: _lastNameController,
                          firstNameController: _firstNameController,
                          confirmPasswordController: _confirmPasswordController,
                        ),
                        ElevatedButton(
                          onPressed: onCreateAccount,
                          child:
                              Text(S.of(context).create_account.capitalize()),
                        ),
                        buildAuthOption(
                          msg: "${S.of(context).have_account}  ",
                          action: S.of(context).login,
                          onTap: () => Navigator.pushReplacementNamed(
                              context, Routes.login),
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

  void onCreateAccount() {
    if (_formKey.currentState!.validate()) {
      final Map<String, bool> res =
          isUserAddedBefore(_emailController.text, _usernameController.text);
      ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
        content: res["status"] == false
            ? S.of(context).account_created
            : res["email"] == true
                ? S.of(context).email_exist
                : S.of(context).username_exist,
        msg: res["status"] == false
            ? S.of(context).redirect_shopping
            : S.of(context).redirect_login,
        backgroundColor: res["status"] == false ? Colors.green : Colors.red,
        action: SnackBarAction(
          label:
              res["status"] == false ? S.of(context).ok : S.of(context).login,
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pushReplacementNamed(
              context,
              Routes.register,
            );
          },
        ),
      ));

      if (res["status"] == false) {
        Navigator.pushReplacementNamed(
          context,
          Routes.shopping,
        );
      }
    }
  }
}

class RegistrationForm extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController lastNameController;
  final TextEditingController firstNameController;
  final TextEditingController confirmPasswordController;
  const RegistrationForm({
    super.key,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
    required this.lastNameController,
    required this.firstNameController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: InputField(
                icon: Icons.person,
                controller: firstNameController,
                label: S.of(context).first_name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).required;
                  } else if (value[0] != value[0].toUpperCase()) {
                    return S.of(context).capital_name;
                  } else if (value.length < 3) {
                    return S.of(context).short_name;
                  } else if (value.length > 15) {
                    return S.of(context).long_name;
                  } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                    return S.of(context).invalid_name;
                  }
                  return null;
                },
              ),
            ),
            Expanded(
              child: InputField(
                icon: Icons.person,
                controller: lastNameController,
                label: S.of(context).last_name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).required;
                  } else if (value[0] != value[0].toUpperCase()) {
                    return S.of(context).capital_name;
                  } else if (value.length < 3) {
                    return S.of(context).short_name;
                  } else if (value.length > 15) {
                    return S.of(context).long_name;
                  } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                    return S.of(context).invalid_name;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        InputField(
            phone: true,
            icon: Icons.phone_android,
            controller: phoneController,
            label: S.of(context).phone_number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).required;
              } else if (!RegExp(r"^01[0125]\d{8}$").hasMatch(value)) {
                return S.of(context).invalid_phone;
              }
              return null;
            }),
        InputField(
            email: true,
            icon: Icons.account_circle,
            label: S.of(context).username,
            controller: usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).required;
              } else if (value.length < 3) {
                return S.of(context).short_username;
              } else if (value.length > 15) {
                return S.of(context).long_username;
              } else if (!RegExp(r"^[a-zA-Z0-9@-_#]+$").hasMatch(value)) {
                return S.of(context).strong_username;
              }
              return null;
            }),
        InputField(
            email: true,
            icon: Icons.email,
            label: S.of(context).email,
            controller: emailController,
            validator: (value) {
              final regex =
                  RegExp(r"^[a-zA-Z0-9_-]+@([a-zA-Z]+\.)+[a-zA-Z]{2,}$");
              if (value == null || value.isEmpty) {
                return S.of(context).required;
              } else if (!regex.hasMatch(value)) {
                return S.of(context).invalid_email;
              }
              return null;
            }),
        PasswordInputField(
          label: S.of(context).password,
          controller: passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).required;
            } else if (value.length < 6) {
              return S.of(context).short_password;
            }
            if (!RegExp(
                    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&\-])[A-Za-z\d@$!%*?&-]{6,}$")
                .hasMatch(value)) {
              return S.of(context).invalid_password;
            }
            return null;
          },
        ),
        PasswordInputField(
            label: S.of(context).confirm_password,
            controller: confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).required;
              } else if (value != passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            }),
      ],
    );
  }
}
