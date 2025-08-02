import 'package:bloc_food_delivery_app/views/widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class ProductListContent extends StatefulWidget {
  const ProductListContent({super.key});

  @override
  State<ProductListContent> createState() => _ProductListContentState();
}

class _ProductListContentState extends State<ProductListContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Ara',
                suffixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.6,
                children: [ProductCard()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
