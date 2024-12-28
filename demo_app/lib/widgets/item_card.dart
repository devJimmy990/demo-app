import 'package:demo_app/data/model/item.dart';
import 'package:demo_app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  const ItemCard({super.key, required this.item});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isFavorite = false;
  bool isCart = false;

  void _addToFavorite() {
    ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
        itemName: widget.item.name,
        backgroundColor: isFavorite ? Colors.red : Colors.green,
        msg:
            " ${isFavorite ? "Removed from favorites" : "Added to favorites"}"));
    setState(() => isFavorite = !isFavorite);
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
        itemName: widget.item.name,
        backgroundColor: isCart ? Colors.red : Colors.green,
        msg: " ${isCart ? "Removed from cart" : "Added to Cart"}"));
    setState(() => isCart = !isCart);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //check if the image if from assets or network
              widget.item.image.contains("assets/")
                  ? Image.asset(
                      widget.item.image,
                      height: 120,
                    )
                  : Image.network(
                      widget.item.image,
                      height: 120,
                    ),
              Center(
                child: Text(
                  widget.item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // favorite and cart buttons
          Column(
            spacing: 2,
            children: [
              IconButton(
                onPressed: _addToFavorite,
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              ),
              IconButton(
                onPressed: _addToCart,
                icon: Icon(isCart
                    ? Icons.remove_shopping_cart
                    : Icons.shopping_cart_sharp),
              ),
              Icon(
                Icons.visibility,
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
