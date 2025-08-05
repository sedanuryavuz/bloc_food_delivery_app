import 'package:bloc_food_delivery_app/ui/views/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../widgets/BottomNavBar.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/ProductListContent.dart';
import 'cart_screen.dart';

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
      appBar: _selectedIndex == 0
          ? PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: const HomeAppBar(),
      )
          : null,

      body: _buildBody(),
      floatingActionButton: SizedBox(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
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

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const ProductListContent();
      case 1:
        return const Center(child: Text("Favoriler Sayfası (yakında)"));
      case 2:
        return const RegisterScreen();
      default:
        return const Center(child: Text("Sayfa bulunamadı"));
    }
  }
}
