import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/entity/Products.dart';

class CartCubit extends Cubit<List<Map<String, dynamic>>> {
  CartCubit() : super([]);

  void addToCart(Product product, {int quantity = 1}) {
    final existingIndex = state.indexWhere((item) => item["id"] == product.id);

    if (existingIndex != -1) {
      final updatedCart = [...state];
      updatedCart[existingIndex]["quantity"] += quantity;
      emit(updatedCart);
    } else {
      emit([
        ...state,
        {
          "id": product.id,
          "name": product.name,
          "price": product.price,
          "quantity": quantity,
          "image": "http://kasimadalan.pe.hu/yemekler/resimler/${product.imageName}"
        }
      ]);
    }
  }

  void removeFromCart(int index) {
    final updatedCart = [...state]..removeAt(index);
    emit(updatedCart);
  }

  void clearCart() {
    emit([]);
  }
}
