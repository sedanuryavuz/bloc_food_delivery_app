import 'package:bloc_food_delivery_app/ui/bloc/product_list/product_list_bloc.dart';
import 'package:bloc_food_delivery_app/ui/bloc/product_list/product_list_event.dart';
import 'package:bloc_food_delivery_app/ui/bloc/product_list/product_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ProductCard.dart';

class ProductListContent extends StatefulWidget {
  const ProductListContent({super.key});

  @override
  State<ProductListContent> createState() => _ProductListContentState();
}

class _ProductListContentState extends State<ProductListContent> {
  @override
  void initState() {
    super.initState();
    context.read<ProductListBloc>().add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              onChanged: (value) {
                context.read<ProductListBloc>().add(FilterProducts(value));
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<ProductListBloc, ProductListState>(
                builder: (context, state) {
                  if (state is ProductListLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductListLoaded) {
                    if (state.foods.isEmpty) {
                      return const Center(
                        child: Text('Arama sonucu bulunamadı.'),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.6,
                      children: state.foods
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    );
                  } else if (state is ProductListError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
