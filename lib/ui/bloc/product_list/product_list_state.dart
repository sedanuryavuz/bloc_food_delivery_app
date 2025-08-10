import 'package:bloc_food_delivery_app/data/entity/Products.dart';

abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final List<Product> foods;
  ProductListLoaded(this.foods);
}

class ProductListError extends ProductListState {
  final String message;
  ProductListError(this.message);
}
