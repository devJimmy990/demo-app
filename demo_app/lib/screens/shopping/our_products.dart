import 'package:flutter/material.dart';
import 'package:demo_app/generated/l10n.dart';

class OurProducts extends StatelessWidget {
  const OurProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).our_products,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        // PageView for product images
        SizedBox(
          height: mediaQuery.height * 0.3,
          child: PageView(
            children: [
              Image.asset("assets/images/products/1.png", fit: BoxFit.cover),
              Image.asset("assets/images/products/2.png", fit: BoxFit.cover),
              Image.asset("assets/images/products/3.png", fit: BoxFit.cover),
            ],
          ),
        ),
      ],
    );
  }
}
