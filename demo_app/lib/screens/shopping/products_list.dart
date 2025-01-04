import 'package:flutter/material.dart';
import 'package:demo_app/data/data.dart';
import 'package:demo_app/generated/l10n.dart';
import 'package:demo_app/screens/shopping/widgets/item_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).products,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.75,
          ),
          itemCount: itemsList.length,
          itemBuilder: (context, index) {
            return ItemCard(item: itemsList[index]);
          },
        ),
      ],
    );
  }
}
