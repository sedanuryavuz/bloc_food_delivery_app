import 'package:bloc_food_delivery_app/data/entity/Products.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() => quantity++);
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() => quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final total = product.price * quantity;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navbarItemColor,
        toolbarHeight: 3,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, size: 28.0),
                    ),
                    const Text(
                      "Ürün Detayı",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star_border, color: Colors.orange),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 310,
                child: Image.network(
                  'http://kasimadalan.pe.hu/yemekler/resimler/${product.imageName}',
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "₺${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.navbarItemColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: decreaseQuantity,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.navbarItemColor,
                            fixedSize: const Size(60, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Icon(Icons.remove, color: Colors.white),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: increaseQuantity,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.navbarItemColor,
                            fixedSize: const Size(60, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final label in [
                          "25-35 dk",
                          "Ücretsiz Teslimat",
                          "%10 İndirim",
                        ])
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              label,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "₺${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Sepete ekleme işlevi
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navbarItemColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 38,
                  vertical: 14,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              child: const Text(
                "Sepete Ekle",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
