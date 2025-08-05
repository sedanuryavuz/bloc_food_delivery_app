import 'dart:io';

import 'package:bloc_food_delivery_app/data/repo/products_dao_repo.dart';
import 'package:bloc_food_delivery_app/ui/cubit/product_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';


import 'ui/constants/app_colors.dart';
import 'ui/views/screens/home_screen.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

void main() async{

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>ProductListCubit(ProductsDaoRepository())),
      ],
      child: MaterialApp(
        title: 'Yemek Sipariş',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.navbarItemColor),
        ),
      
        home: HomeScreen(),
      ),
    );
  }
}

