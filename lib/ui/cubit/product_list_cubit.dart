import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_food_delivery_app/data/repo/products_dao_repo.dart';
import 'package:bloc_food_delivery_app/ui/cubit/product_list_state.dart';
import '../../data/entity/Products.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductsDaoRepository repository;

  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];

  ProductListCubit(this.repository) : super(ProductListInitial());

  void loadProducts() async {
    emit(ProductListLoading());

    try {
      _allProducts = await repository.fetchProducts();
      _filteredProducts = List.from(_allProducts);
      emit(ProductListLoaded(_filteredProducts));
    } catch (e) {
      emit(ProductListError("Yemekler yüklenemedi: $e"));
    }
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = List.from(_allProducts);
    } else {
      _filteredProducts = _allProducts
          .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(ProductListLoaded(_filteredProducts));
  }
}
