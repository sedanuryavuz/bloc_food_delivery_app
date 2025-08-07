import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDaoRepository {
  Future<void> register(String username, String email, String password) async {
    const String apiUrl = 'http://10.0.2.2:3000/api/register';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print('Kayıt başarılı: ${responseData['user']}');
      } else {
        print('Hata oluştu: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('İstek hatası: $e');
    }
  }

  Future<void> login(String email, String password) async {
    const String apiUrl = 'http://10.0.2.2:3000/api/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Giriş başarılı: ${responseData['user']}');
      } else {
        throw Exception(
          'Hata oluştu: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('İstek hatası: $e');
    }
  }
}
