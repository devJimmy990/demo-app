import 'package:flutter/material.dart';

Widget buildAuthOption({
  required String msg,
  required String action,
  required void Function() onTap,
}) =>
    MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: msg),
              TextSpan(
                text: action,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
