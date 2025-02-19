import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/presentation/widgets/ui/inputs.dart';
import 'package:demo_app/presentation/widgets/auth/auth_option.dart';
import 'package:demo_app/presentation/screens/auth/func/methods.dart';
import 'package:demo_app/presentation/screens/auth/func/validator.dart';

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
                        _RegistrationForm(
                          phoneController: _phoneController,
                          emailController: _emailController,
                          usernameController: _usernameController,
                          passwordController: _passwordController,
                          lastNameController: _lastNameController,
                          firstNameController: _firstNameController,
                          confirmPasswordController: _confirmPasswordController,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final Map<String, bool> res = isUserAddedBefore(
                                  _emailController.text,
                                  _usernameController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  _buildRegisterSnackBar(res, context));

                              if (res["status"] == false) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.login,
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
}

class _RegistrationForm extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController lastNameController;
  final TextEditingController firstNameController;
  final TextEditingController confirmPasswordController;
  const _RegistrationForm({
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
                label: "First Name",
                icon: Icons.person,
                controller: firstNameController,
                validator: Validator.validateName,
              ),
            ),
            Expanded(
              child: InputField(
                label: "Second Name",
                icon: Icons.person,
                controller: lastNameController,
                validator: Validator.validateName,
              ),
            ),
          ],
        ),
        InputField(
          phone: true,
          label: "Phone Number",
          icon: Icons.phone_android,
          controller: phoneController,
          validator: Validator.validatePhone,
        ),
        InputField(
          email: true,
          label: "Username",
          icon: Icons.account_circle,
          controller: usernameController,
          validator: Validator.validateUsername,
        ),
        InputField(
          email: true,
          label: "Email",
          icon: Icons.email,
          controller: emailController,
          validator: Validator.validateEmail,
        ),
        PasswordInputField(
          label: "Password",
          controller: passwordController,
          validator: Validator.validatePassword,
        ),
        PasswordInputField(
          label: "Confirm Password",
          controller: confirmPasswordController,
          validator: (value) =>
              Validator.validateConfirmPassword(value, passwordController.text),
        ),
      ],
    );
  }
}

SnackBar _buildRegisterSnackBar(Map<String, bool> res, BuildContext context) {
  return SnackBar(
    backgroundColor: res["status"] == false ? Colors.green : Colors.red,
    content: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
                '${res["status"] == false ? "Account Created Successfully" : res["email"] == true ? "This email already exist" : "This username already exist"}\n',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: res["status"] == false
                ? "will redirect to shopping page"
                : "redirect to login page",
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
      label: res["status"] == false ? "OK" : "create",
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
