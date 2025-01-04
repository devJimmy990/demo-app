import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/routes.dart';
import 'package:demo_app/generated/l10n.dart';
import 'package:demo_app/screens/shopping/hot_offers.dart';
import 'package:demo_app/screens/shopping/our_products.dart';
import 'package:demo_app/screens/shopping/products_list.dart';

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
            onPressed: () =>
                Navigator.pushReplacementNamed(context, Routes.login)),
        title: Text(
          S.of(context).shopping_app_bar,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
              onPressed: () {
                S.load(Locale(Intl.getCurrentLocale() == "en" ? "ar" : "en"));
              },
              child: Text(Intl.getCurrentLocale() == "en" ? "ar" : "en"))
        ],
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
              HotOffers()
            ],
          ),
        ),
      ),
    );
  }
}
