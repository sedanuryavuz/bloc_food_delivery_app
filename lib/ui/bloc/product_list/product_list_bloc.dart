import 'package:bloc_food_delivery_app/data/entity/Products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_food_delivery_app/data/repo/products_dao_repo.dart';
import 'product_list_event.dart';
import 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductsDaoRepository repository;

  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];

  ProductListBloc(this.repository) : super(ProductListInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<FilterProducts>(_onFilterProducts);
  }

  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductListState> emit) async {
    emit(ProductListLoading());
    try {
      _allProducts = await repository.fetchProducts();
      _filteredProducts = List.from(_allProducts);
      emit(ProductListLoaded(_filteredProducts));
    } catch (e) {
      emit(ProductListError("Yemekler yüklenemedi: $e"));
    }
  }

  void _onFilterProducts(
      FilterProducts event, Emitter<ProductListState> emit) {
    if (event.query.isEmpty) {
      _filteredProducts = List.from(_allProducts);
    } else {
      _filteredProducts = _allProducts
          .where((product) =>
          product.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
    }
    emit(ProductListLoaded(_filteredProducts));
  }
}
