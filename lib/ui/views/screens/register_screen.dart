import 'package:bloc_food_delivery_app/data/sqlite/database_helper.dart';
import 'package:bloc_food_delivery_app/ui/views/widgets/ReusableTextField.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../constants/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String password = '';

  void _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final exists = await DatabaseHelper.instance.checkUserExists(email);

      if (exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bu e-posta ile zaten kayıt olunmuş')),
        );
        return;
      }

      await DatabaseHelper.instance.insertUser({
        'user_name': fullName,
        'email': email,
        'password': password,
      });

      print("Kayıt olundu: $fullName, $email, $password");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kayıt başarılı!')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Kayıt Ol"),
        backgroundColor: AppColors.navbarItemColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Icon(Icons.person_add_alt_1, size: 100, color: AppColors.navbarItemColor),
              const SizedBox(height: 30),

              ReusableTextField(
                labelText: 'Ad Soyad',
                icon: Icons.person,
                validator: (value) => value!.isEmpty ? 'Ad soyad girin' : null,
                onSaved: (value) => fullName = value!,
              ),
              const SizedBox(height: 20),

              ReusableTextField(
                labelText: 'E-posta',
                icon: Icons.email,
                validator: (value) =>
                value!.isEmpty || !value.contains('@') ? 'Geçerli e-posta girin' : null,
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 20),

              ReusableTextField(
                labelText: 'Şifre',
                icon: Icons.lock,
                obscureText: true,
                validator: (value) => value!.length < 6 ? 'En az 6 karakter girin' : null,
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navbarItemColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Kayıt Ol",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Zaten hesabın var mı? Giriş yap"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
