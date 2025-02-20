import 'package:demo_app/presentation/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/presentation/shopping/our_products.dart';
import 'package:demo_app/presentation/shopping/products_list.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Shopping App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: AppDrawer(),
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
