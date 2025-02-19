import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? email;
  final bool? phone;
  const InputField({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.email,
    this.phone,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: email == true
          ? TextInputType.emailAddress
          : phone == true
              ? TextInputType.phone
              : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: Icon(icon, color: Colors.black),
      ),
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const PasswordInputField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () => setState(() => obscureText = !obscureText),
        ),
      ),
    );
  }
}
