class User {
  final int? id;
  final String kullaniciAdi;
  final String email;
  final String sifre;

  User({this.id, required this.kullaniciAdi, required this.email, required this.sifre});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kullanici_adi': kullaniciAdi,
      'email': email,
      'sifre': sifre,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      kullaniciAdi: map['kullanici_adi'],
      email: map['email'],
      sifre: map['sifre'],
    );
  }
}
