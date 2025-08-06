class User {
  final int? id;
  final String kullaniciAdi;
  final String email;
  final String sifre;

  User({this.id, required this.kullaniciAdi, required this.email, required this.sifre});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_name': kullaniciAdi,
      'email': email,
      'password': sifre,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      kullaniciAdi: map['user_name'],
      email: map['email'],
      sifre: map['password'],
    );
  }
}
