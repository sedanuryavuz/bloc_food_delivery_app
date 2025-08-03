import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CartItemCard extends StatefulWidget {
  final Map<String, dynamic> item;
  final VoidCallback onDelete;

  const CartItemCard({super.key, required this.item, required this.onDelete});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    final subtotal = widget.item["price"] * widget.item["quantity"];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.item["image"],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Fiyat: ",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    Text(
                      "₺${widget.item["price"]}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Adet: ${widget.item["quantity"]}",
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.navbarItemColor,
                  size: 40,
                ),
                onPressed: widget.onDelete,
              ),
              const SizedBox(height: 30),
              Text(
                "₺$subtotal",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
