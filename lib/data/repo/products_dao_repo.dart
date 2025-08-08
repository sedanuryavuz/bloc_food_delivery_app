import 'dart:convert';
import 'package:bloc_food_delivery_app/data/entity/Products.dart';
import 'package:http/http.dart' as http;

class ProductsDaoRepository {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"),

    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> productsJson = body["yemekler"];

      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Yemekler getirilemedi.");
    }
  }
}
