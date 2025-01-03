import 'package:flutter/material.dart';

SnackBar buildSnackBar({
  required String msg,
  SnackBarAction? action,
  required String content,
  required Color backgroundColor,
}) {
  return SnackBar(
    backgroundColor: backgroundColor,
    content: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$content\n',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: msg,
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
    action: action,
  );
}
