import 'package:flutter/material.dart';
import 'package:demo_app/data/data.dart';
import 'package:demo_app/screens/shopping/widgets/offer_card.dart';

class HotOffers extends StatelessWidget {
  const HotOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hot Offers",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // list-view for hot offers
        SizedBox(
          height: mediaQuery.height * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,// scroll direction
            itemCount: offersList.length,
            itemBuilder: (context, index) {
              return buildOfferCart(offer: offersList[index]);
            },
          ),
        ),
      ],
    );
  }
}
