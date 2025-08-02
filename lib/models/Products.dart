class Product {
  final String title;
  final String subtitle;
  final double price;
  bool isFavorite;

  Product({
    required this.title,
    required this.subtitle,
    required this.price,
    this.isFavorite = false,
  });
}
final product1 = Product(title: "Pizza", subtitle: "Bol peynirli", price: 12.99);
final product2 = Product(title: "Burger", subtitle: "Özel soslu", price: 9.99, isFavorite: true);
