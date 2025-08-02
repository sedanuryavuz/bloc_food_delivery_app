import 'package:bloc_food_delivery_app/constants/app_colors.dart';
import 'package:bloc_food_delivery_app/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yemek Sipariş',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.navbarItemColor),
      ),

      home: HomeScreen(),
    );
  }
}

