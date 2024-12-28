import 'package:flutter/material.dart';
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
        centerTitle: true,
        title: const Text('Shopping App'),
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
