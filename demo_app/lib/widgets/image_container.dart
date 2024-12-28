import 'package:flutter/material.dart';

Widget imageContainer({required Widget child}) => Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: child,
        ),
      ),
    );
