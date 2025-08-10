import 'package:bloc_food_delivery_app/ui/bloc/cart/cart_event.dart';
import 'package:bloc_food_delivery_app/ui/bloc/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final currentState = state is CartLoaded
        ? List<Map<String, dynamic>>.from((state as CartLoaded).items)
        : <Map<String, dynamic>>[];

    final existingIndex = currentState.indexWhere((item) => item["id"] == event.product.id);

    if (existingIndex != -1) {
      currentState[existingIndex]["quantity"] += event.quantity;
    } else {
      currentState.add({
        "id": event.product.id,
        "name": event.product.name,
        "price": event.product.price,
        "quantity": event.quantity,
        "image": "http://kasimadalan.pe.hu/yemekler/resimler/${event.product.imageName}"
      });
    }

    emit(CartLoaded(currentState));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final updatedCart = List<Map<String, dynamic>>.from((state as CartLoaded).items)
        ..removeAt(event.index);
      emit(CartLoaded(updatedCart));
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartLoaded([]));
  }
}