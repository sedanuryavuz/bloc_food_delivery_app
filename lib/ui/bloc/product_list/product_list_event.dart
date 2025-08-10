abstract class ProductListEvent {}

class LoadProducts extends ProductListEvent {}

class FilterProducts extends ProductListEvent {
  final String query;
  FilterProducts(this.query);
}
