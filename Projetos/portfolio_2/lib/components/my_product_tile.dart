import 'package:flutter/material.dart';
import 'package:portfolio_2/models/product.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          //Image
          Icon(Icons.favorite),
          //Name
          Text(product.name),
          //Description
          Text(product.description),
          //Price + Add to cart buttom
          Text(product.price.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
