class Product {
  final int id;
  final String name;
  final String imageName;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.imageName,
    required this.price,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json["yemek_id"]),
      name: json["yemek_adi"],
      imageName: json["yemek_resim_adi"],
      price: double.parse(json["yemek_fiyat"]),
    );
  }
}
