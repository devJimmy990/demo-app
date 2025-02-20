import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/controller/user.dart';
import 'package:demo_app/data/model/user.dart';
import 'package:demo_app/core/validator/index.dart';
import 'package:demo_app/presentation/widgets/ui/inputs.dart';
import 'package:demo_app/presentation/widgets/auth/auth_option.dart';

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
  late final TextEditingController _confirmPasswordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
                        _RegistrationForm(
                          phoneController: _phoneController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          lastNameController: _lastNameController,
                          firstNameController: _firstNameController,
                          confirmPasswordController: _confirmPasswordController,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final controller = context.read<UserController>();
                              try {
                                await controller.createUser(UserModel.register(
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  lName: _lastNameController.text,
                                  fName: _firstNameController.text,
                                  password: _passwordController.text,
                                ));

                                buildSnackBar(
                                  bgColor: Colors.green,
                                  msg: "account created successfully",
                                );
                              } catch (e) {
                                buildSnackBar(
                                  bgColor: Colors.red,
                                  msg: FirebaseValidator.register(e.toString()),
                                );
                              }
                            }
                          },
                          child: const Text("Create Account"),
                        ),
                        buildAuthOption(
                          msg: "Already have an account?  ",
                          action: "login",
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

class _RegistrationForm extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController lastNameController;
  final TextEditingController firstNameController;
  final TextEditingController confirmPasswordController;
  const _RegistrationForm({
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
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
                label: "First Name",
                icon: Icons.person,
                controller: firstNameController,
                validator: InputValidator.validateName,
              ),
            ),
            Expanded(
              child: InputField(
                label: "Second Name",
                icon: Icons.person,
                controller: lastNameController,
                validator: InputValidator.validateName,
              ),
            ),
          ],
        ),
        InputField(
          phone: true,
          label: "Phone Number",
          icon: Icons.phone_android,
          controller: phoneController,
          validator: InputValidator.validatePhone,
        ),
        InputField(
          email: true,
          label: "Email",
          icon: Icons.email,
          controller: emailController,
          validator: InputValidator.validateEmail,
        ),
        PasswordInputField(
          label: "Password",
          controller: passwordController,
          validator: InputValidator.validatePassword,
        ),
        PasswordInputField(
          label: "Confirm Password",
          controller: confirmPasswordController,
          validator: (value) => InputValidator.validateConfirmPassword(
              value, passwordController.text),
        ),
      ],
    );
  }
}
