import 'package:bloc_food_delivery_app/constants/app_colors.dart';
import 'package:bloc_food_delivery_app/views/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_food_delivery_app/models/Products.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(),
          ),
        );
      },
      child: SizedBox(
        height: 250,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.fastfood, size: 60, color: AppColors.navbarItemColor),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      product1.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      product1.subtitle,
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product1.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle, color: AppColors.navbarItemColor,),
                          onPressed: () {
                            print("Sepete eklendi");

                          },

                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  product1.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.navbarItemColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
