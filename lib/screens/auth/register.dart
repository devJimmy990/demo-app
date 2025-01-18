import 'package:demo_app/core/routes.dart';
import 'package:demo_app/screens/auth/func/methods.dart';
import 'package:demo_app/screens/auth/func/validator.dart';
import 'package:demo_app/screens/auth/widgets/auth_option.dart';
import 'package:demo_app/screens/auth/widgets/snackbar.dart';
import 'package:demo_app/screens/shopping/page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'widgets/inputs.dart';

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

  void onCreateAccount() {
    if (_formKey.currentState!.validate()) {
      final Map<String, bool> res =
          isUserAddedBefore(_emailController.text, _usernameController.text);
      ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
        content: res["status"] == false
            ? "Account Created Successfully"
            : res["email"] == true
                ? "This email already exist"
                : "This username already exist",
        msg: res["status"] == false
            ? "will redirect to shopping page"
            : "redirect to login page",
        backgroundColor: res["status"] == false ? Colors.green : Colors.red,
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
      ));

      if (res["status"] == false) {
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
