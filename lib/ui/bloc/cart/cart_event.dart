import 'package:bloc_food_delivery_app/data/entity/Products.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final Product product;
  final int quantity;

  AddToCart(this.product, {this.quantity = 1});
}
class RemoveFromCart extends CartEvent {
  final int index;

  RemoveFromCart(this.index);
}

class ClearCart extends CartEvent {}