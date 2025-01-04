import 'package:demo_app/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/screens/shopping/hot_offers.dart';
import 'package:demo_app/screens/shopping/our_products.dart';
import 'package:demo_app/screens/shopping/products_list.dart';
import 'package:page_transition/page_transition.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 1000),
                    child: const LoginPage(),
                  ),
                )),
        title: const Text(
          'Shopping App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: mediaQuery.width * 1.5,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // our products
              OurProducts(),

              // grid-view for product cards
              ProductsList(),

              // hot offers
              // HotOffers()
            ],
          ),
        ),
      ),
    );
  }
}
