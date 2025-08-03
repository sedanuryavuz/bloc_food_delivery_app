import 'package:bloc_food_delivery_app/constants/app_colors.dart';
import 'package:bloc_food_delivery_app/views/screens/cart_screen.dart';
import 'package:bloc_food_delivery_app/views/widgets/BottomNavBar.dart';
import 'package:bloc_food_delivery_app/views/widgets/HomeAppBar.dart';
import 'package:bloc_food_delivery_app/views/widgets/ProductListContent.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: const HomeAppBar(),
      ),
      body: const ProductListContent(),
      floatingActionButton: SizedBox(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => CartScreen()));
          },
          backgroundColor: AppColors.navbarItemColor,
          shape: const CircleBorder(),
          child: const Icon(Icons.shopping_cart, size: 40, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
