import 'package:flutter/material.dart';

SnackBar buildSnackBar({
  required String itemName,
  required Color backgroundColor,
  required String msg,
}) =>
    SnackBar(
      backgroundColor: backgroundColor,
      content: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: itemName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: msg,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 2),
    );
